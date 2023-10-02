module Web
  module Request
    module GetShipments
      def url
        "#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/get_shipments"
      end

      def get_shipments(token:)
        http_client.get(url, { headers: { x_token_auth: token } })
      end
    end
  end
end
