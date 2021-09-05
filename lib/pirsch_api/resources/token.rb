module PirschApi
  
  class TokenResource

    def initialize(client_id, client_secret)
      @client_id     = client_id
      @client_secret = client_secret
    end
    
    def request_url
      "token"
    end

    def request_body
      {
        "client_id" => @client_id,
        "client_secret" => @client_secret
      }.to_json
    end

    def parse_response(body)
      Token.new JSON.parse(body)
    end

    def run
      uri = URI.parse "#{PirschApi::Client::BASE_URL}/#{request_url}"
      puts uri
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      header = { 'Content-Type': 'text/json' }
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = request_body
      
      response = http.request(request)

      raise Error.new "Token request failed. (#{response.body})" unless response.code == "200"
      
      parse_response(response.body)
    end
  end
end