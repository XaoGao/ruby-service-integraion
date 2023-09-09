module Settings
  class TaskSettings
    attr_reader :send_stock, :get_shipments

    def initialize(task_settings)
      raise Error "task_settings can not be nil" if task_settings.nil?

      @send_stock = task_settings[:send_stock]
      @get_shipments = task_settings[:get_shipments]
    end
  end
end
