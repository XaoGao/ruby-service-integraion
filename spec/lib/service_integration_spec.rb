RSpec.describe ServiceIntegration do
  subject(:main) { described_class }

  describe "launch project" do
    it { expect(main.class).to eq(ServiceIntegration) }
  end
end
