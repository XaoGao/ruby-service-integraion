module Settings
  class AbstractTask
    attr_reader :name, :run, :schedule, :emails

    def initialize(task)
      @name = task[:name]
      @run = task[:run]
      @schedule = task[:schedule]
      @emails = task[:emails]
    end
  end
end
