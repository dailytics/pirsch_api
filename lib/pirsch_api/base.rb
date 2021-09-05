module PirschApi
  class Base
    def initialize(access_token = nil, filters = nil)
      @access_token = access_token
      @filters      = filters
      @errors       = []
    end

    def request_url
      raise NotImplementedError
    end

    def parse_response(body)
      JSON.parse(body)
    end

    def errors
      @errors << { access_token: 'access token is required' } if @access_token.nil?
      @errors
    end

    def valid?
      errors.empty?
    end

    def run
      raise PirschApi::Error.new errors unless valid?
      
      uri = URI.parse(request_url)

      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field('Authorization', "Bearer #{@access_token}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true  
      
      response = http.request(req)
      raise PirschApi::Error.new "Api request failed (#{response.body})" unless response.code == "200"

      parse_response response.body
    end
  end
end