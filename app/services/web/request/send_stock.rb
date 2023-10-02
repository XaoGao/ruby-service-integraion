module Web
  module Request
    module SendStock
      def url
        "#{ENV.fetch('OUTSYSTEM_BASE_URL')}/api/v1/stocks"
      end

      def send_stock(token:, stock:)
        http_client.post(url,
                         headers: { x_token_auth: token },
                         body: stock.to_json)
      end
    end
  end
end
