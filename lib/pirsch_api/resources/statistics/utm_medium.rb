module PirschApi
  class UtmMediumResource < BaseResource
    def request_url
      "statistics/utm/medium"
    end
    
    def parse_response(body)
      JSON.parse(body).map{ |o| UtmMedium.new o }
    end
  end
end