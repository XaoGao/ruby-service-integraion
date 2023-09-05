Sequel.migration do
  up do
    create_table(:merchants) do
      primary_key :id

      String :name
      String :code
      Boolean :active

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:merchants)
  end
end
