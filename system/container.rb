require "dry/system"
require "dry/system/container"

class Application < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch("RACK_ENV", :development).to_sym }
  use :zeitwerk
  # use :monitoring

  configure do |config|
    config.component_dirs.add "lib"
    config.component_dirs.add "system"
    config.component_dirs.add "app"

    path = File.join(root, "app")
    dirs = Dir.entries(path).select { |entry| File.directory?(File.join(path, entry)) and !(entry =='.' || entry == '..') }.to_a
    dirs.each do |dir|
      config.component_dirs.add "app/#{dir}"
    end
  end
end

