module Settings
  class Seller
    attr_reader :is_active, :name, :out_system, :inner_system, :tasks_settings

    def initialize(seller)
      raise Error "seller can not be nil" if seller.nil?

      @is_active = seller[:is_active]
      @name = seller[:_name]
      @out_system = OutSystem.new(seller[:out_system])
      @inner_system = InnerSystem.new(seller[:inner_system])
      @tasks_settings = TaskSettings.new(seller[:tasks_settings])
    end
  end
end
