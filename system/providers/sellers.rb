Application.register_provider(:sellers) do
  prepare do
    require "yaml"
  end

  start do
    config = YAML.safe_load_file(File.join(Application.root, "sellers.#{Application.env}.yml"), symbolize_names: true)

    sellers = Settings::Config.new(config)

    register(:sellers, sellers)
  end
end
