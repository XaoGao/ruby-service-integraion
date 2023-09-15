class AbstractJob
  include Import["logger"]

  def perform(seller, merchant)
    logger.info "start task #{task_name}"
    do_job(seller, merchant)
    logger.info "finish task #{task_name}"
  rescue StandardError => e
    logger.error e.message
  end

  def task_name
    self.class.to_s
  end
end
