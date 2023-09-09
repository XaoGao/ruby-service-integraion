module Settings
  class GetShipments < AbstractTask
    attr_reader :time_offset

    def initialize(get_shipments)
      super(get_shipments)

      @time_offset = get_shipments[:time_offset]
    end
  end
end
