module PirschApi
  class UtmSourceResource < BaseResource
    def request_url
      "statistics/utm/source"
    end
    
    def parse_response(body)
      JSON.parse(body)&.map{ |o| UtmSource.new o }
    end
  end
end