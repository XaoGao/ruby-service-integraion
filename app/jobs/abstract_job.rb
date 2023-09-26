class AbstractJob
  include Sidekiq::Job
  include Import["sellers", "logger"]

  def perform(merchant_id, seller_name, task_name)
    merchant = Merchant.find(id: merchant_id)
    seller = sellers.find { |s| s.name == seller_name }

    logger.info "start task #{task_name}"
    do_job(seller, merchant)
    logger.info "finish task #{task_name}"
  rescue StandardError => e
    logger.error e.message
  end
end
