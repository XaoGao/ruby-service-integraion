require "dry/system"
require "dry/system/container"

class Application < Drt::System::Container
  use :env, inferrer: -> { ENV.fetch("RACK_ENV", :development).to_sym }
  use :zeitwerk

  configure do |config|
    config.component_dirs.add "lib"
    config.component_dirs.add "system"
    config.component_dirs.add "app"
  end
end