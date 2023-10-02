module Web
  module Request
    RSpec.describe GetShipments do
      let(:dummy_class) { Class.new { include Web::Request::GetShipments } }
      let(:dummy_instance) { dummy_class.new }

      before do
        dummy_instance.define_singleton_method(:http_client) do
          HTTParty
        end
      end

      describe "#url" do
        it "the correct url" do
          expect(dummy_instance.url).to eq("#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/get_shipments")
        end
      end

      describe "#get_shipments" do
        before do
          stub_request(:get, "#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/get_shipments")
            .with(headers: { x_token_auth: "some_token_1" })
            .to_return(status: 200, body: "", headers: {})
        end

        let(:response) { dummy_instance.get_shipments(token: "some_token_1") }

        it "success http response" do
          expect(response.code).to eq(200)
        end

        it "empty response" do
          expect(response.body).to eq("")
        end
      end
    end
  end
end
