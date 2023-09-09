module Settings
  class SendStock < AbstractTask
    attr_reader :set_price, :set_amount, :set_amount_type

    def initialize(send_stock)
      super(send_stock)

      @set_price = send_stock[:set_price]
      @set_amount = send_stock[:set_amount]
      @set_amount_type = send_stock[:set_amount_type]
    end
  end
end
