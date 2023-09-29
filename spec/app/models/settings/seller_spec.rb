module Settings
  RSpec.describe Seller do
    subject(:seller) do
      described_class.new(
        is_active:,
        name: "seller_name",
        out_system:,
        inner_system:,
        tasks_settings:
      )
    end

    let(:is_active) { "true" }
    let(:out_system) { {} }
    let(:inner_system) { { intervals: { interval: [] } } }
    let(:tasks_settings) { {} }

    describe ".active?" do
      context "when seller is active" do
        let(:is_active) { "true" }

        it { expect(seller.active?).to be true }
      end

      context "when seller is unactive" do
        let(:is_active) { "false" }

        it { expect(seller.active?).to be false }
      end
    end
  end
end
