module Settings
  class TasksSettings
    attr_reader :send_stock, :get_shipments

    def initialize(tasks_settings)
      @send_stock = SendStock.new(tasks_settings[:send_stock]) unless tasks_settings[:send_stock].nil?
      @get_shipments = GetShipments.new(tasks_settings[:get_shipments]) unless tasks_settings[:get_shipments].nil?
    end

    def tasks
      [send_stock, get_shipments]
    end
  end
end
