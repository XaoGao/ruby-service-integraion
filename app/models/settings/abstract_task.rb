module Settings
  class AbstractTask
    attr_reader :name, :run, :schedule, :emails

    def initialize(task)
      @name = name
      @run = run
      @schedule = schedule
      @emails = emails
    end
  end
end
