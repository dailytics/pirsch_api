module PirschApi
  
  class Token

    def initialize(client_id, client_secret)
      @client_id     = client_id
      @client_secret = client_secret
    end
    
    def request_url
      "https://api.pirsch.io/api/v1/token"
    end

    def request_body
      {
        "client_id" => @client_id,
        "client_secret" => @client_secret
      }.to_json
    end

    def parse_response(body)
      JSON.parse(body)['access_token']
    end

    def run
      uri = URI.parse request_url
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      header = { 'Content-Type': 'text/json' }
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = request_body
      
      response = http.request(request)
      raise PirschApi::Error.new "Token request failed. (#{response.body})" unless response.code == "200"
      
      parse_response(response.body)
    end
  end
end