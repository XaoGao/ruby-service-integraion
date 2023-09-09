module Settings
  class Interval
    attr_reader :work_day, :start_time, :end_time, :login, :password

    def intervals(interval)
      raise Error "interval can not be nil" if interval.nil?

      @work_day = interval[:work_day]
      @start_time = interval[:start_time]
      @end_time = interval[:end_time]
      @login = interval[:login]
      @password = interval[:password]
    end
  end
end
