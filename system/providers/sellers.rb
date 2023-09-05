Application.register_provider(:sellers) do
  prepare do
    require "yaml"
  end

  start do
    sellers = YAML.safe_load_file(File.join(Application.root, "sellers.#{Application.env}.yml"), symbolize_names: true)

    register(:sellers, sellers)
  end
end
