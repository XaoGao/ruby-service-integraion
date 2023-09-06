Sequel.migration do
  up do
    create_table(:shipments) do
      primary_key :id
      foreign_key :merchant_id

      String :external_num
      String :internal_num
      String :status
      DateTime :confirmed
      DateTime :packing
      DateTime :shipping
      DateTime :shipment
      DateTime :shipment
      String :delivery_id
      DateTime :delivery
      DateTime :delivery_from
      DateTime :delivery_to
      String :address
      String :region
      String :city
      String :full_name
      String :shipping_point
      String :shipping
      String :carrier
      String :vehicle
      String :delivery_method_id
      String :labeltext

      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:shipments)
  end
end
