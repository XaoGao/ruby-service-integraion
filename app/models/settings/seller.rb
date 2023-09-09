module Settings
  class Seller
    attr_reader :is_active, :name

    def initialize(seller)
      raise Error "seller can not be nil" if seller.nil?

      @is_active = seller[:is_active]
      @name = seller[:name]
    end
  end
end
