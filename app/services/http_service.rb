class HttpService
  include Web::Request::GetShipments
  include Web::Request::SendStock

  attr_reader :http_client

  def initialize
    @http_client = HTTParty
  end
end
