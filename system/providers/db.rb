Application.register_provider(:db) do
  prepare do
    require "sequel"
    require "yaml"
  end

  start do
    db_config = YAML.safe_load_file(File.join(Application.root, "lib", "database", "database.yml"),
                                    symbolize_names: true)

    # rubocop:disable Lint/ConstantDefinitionInBlock
    DB = Sequel.connect(db_config[Application.env])
    # rubocop:enable Lint/ConstantDefinitionInBlock

    Sequel::Model.plugin :timestamps, create: :created_at, update: :updated_at, update_on_create: true
    Sequel::Model.plugin :touch
    Sequel::Model.plugin :validation_helpers

    Sequel.extension :migration
    Sequel::Migrator.run(DB, File.join(Application.root, "lib", "database", "migrations"))

    register(:db, DB)
  end
end
