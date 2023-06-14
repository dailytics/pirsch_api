module PirschApi
  class BaseResource
    attr_accessor :client, :filters, :domain

    def initialize(client:, domain: nil, filters: {})
      @client = client
      @filters = filters
      @domain = domain
      @errors = []
    end

    def request_url
      raise NotImplementedError
    end

    def parse_response(body)
      raise NotImplementedError
    end

    def errors
      @errors[:client] = "client is invalid" unless client.valid?
      @errors
    end

    def valid?
      errors.empty?
    end

    def run
      raise PirschApi::Error.new errors unless valid?

      if domain
        filters[:id] = domain.to_s
      end

      url = "#{PirschApi::Client::BASE_URL}/#{request_url}"
      url << "?#{filters.to_a.map { |x| "#{x[0]}=#{CGI.escape(x[1])}" }.join("&")}" if filters.any?

      puts "[Pirsch API] run #{url}"

      uri = URI.parse url

      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field("Authorization", "Bearer #{client.token.access_token}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = http.request(req)
      raise PirschApi::Error.new "Api request failed (#{response.body})" unless response.code == "200"
      raise PirschApi::Error.new "Api request returned nil (#{response.body})" if response.body.nil?

      parse_response response.body
    end
  end
end
