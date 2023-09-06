class Shipment < Sequel::Model(DB)
  include AASM

  many_to_one :merchant

  aasm do
    state :init, initial: true
  end
end
