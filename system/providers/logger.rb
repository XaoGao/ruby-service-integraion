Application.register_provider(:logger) do
  prepare do
    require "logger"
  end

  start do
    register(:logger, Logger.new($stdout))
  end
end
