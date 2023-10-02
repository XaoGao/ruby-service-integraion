Application.register_provider(:tasks) do
  prepare do
    require "sidekiq"
    require "sidekiq-cron"
  end

  start do
    Sidekiq.configure_server do |config|
      config.redis = { url: ENV.fetch("REDIS_URL") }
    end

    return if Application.env == :test

    target.start :sellers
    target.start :logger

    sellers = target[:sellers]
    logger = target[:logger]

    Sidekiq::Cron::Job.destroy_all!

    merchants = Merchant.where(active: true)
    merchants.each do |merchant|
      seller = sellers.sellers.find { |s| s.name == merchant.name }
      if seller.nil?
        logger.error "sellers with name #{merchant.name} is not found"
        next
      end

      unless seller.active?
        logger.info "seller #{seller.name} is disable"
        next
      end

      seller.tasks_settings.tasks.each do |task|
        task_name = task.class.name.split("::").last
        job_name = "#{task_name}Job"
        job = Object.const_get(job_name)
        Sidekiq::Cron::Job.create(
          name: task.name,
          cron: task.schedule,
          class: job,
          args: [merchant.id, seller.name, task.class.name.split("::").last]
        )
      end
    end
  end
end
