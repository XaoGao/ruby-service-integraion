class Shipment < Sequel::Model(DB)
  many_to_one :merchant
end
