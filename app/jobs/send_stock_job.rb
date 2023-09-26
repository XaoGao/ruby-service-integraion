class SendStockJob < AbstractJob
  def do_job(seller, merchant)
    logger.info "send stock job"
  end
end
