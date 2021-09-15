module PirschApi
  class DurationSessionResource < BaseResource
    def request_url
      "statistics/duration/session"
    end
    
    def parse_response(body)
      JSON.parse(body).map{ |o| DurationSession.new o }
    end
  end
end