module Models
  module Settings
    class Sellers
      attr_read :sellers

      def initialize(sellers)
        raise Error "sellers can not be nil" if sellers.nil?

        @sellers = sellers
      end
    end
  end
end

