class SendStockJob < AbstractJob
  def do_job(seller, merchant)
    logger.info "test"
  end
end
