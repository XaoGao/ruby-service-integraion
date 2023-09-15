RSpec.describe SendStockJob do
  subject(:job) { described_class.new }

  describe ".do_job" do
    it "test" do
      expect(job.perform(nil, nil)).to be_nil
    end
  end
end
