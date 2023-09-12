Application.register_provider(:tasks) do
  prepare do
    require "sidekiq"
    require "sidekiq-cron"
  end

  start do
    Sidekiq.configure_server do |config|
      config.redis = { url: ENV.fetch("REDIS_URL") }
    end

    target.start :sellers
    target.start :logger
  end
end
