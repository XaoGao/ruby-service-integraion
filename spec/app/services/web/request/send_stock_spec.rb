module Web
  module Request
    RSpec.describe SendStock do
      let(:dummy_class) { Class.new { include Web::Request::SendStock } }
      let(:dummy_instance) { dummy_class.new }

      before do
        dummy_instance.define_singleton_method(:http_client) do
          HTTParty
        end
      end

      describe "#url" do
        it "returns the correct url" do
          expect(dummy_instance.url).to eq("#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/stocks")
        end
      end

      describe "#send_stock" do
        before do
          stub_request(:post, "#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/stocks")
            .with(headers: { x_token_auth: "some_token_1" })
            .to_return(status: 201, body: "", headers: {})
        end

        let(:response) { dummy_instance.send_stock(token: "some_token_1", stock: { some_data: "data" }) }

        it "success http response" do
          expect(response.code).to eq(201)
        end

        it "empty response" do
          expect(response.body).to eq("")
        end
      end
    end
  end
end
