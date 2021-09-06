module PirschApi
  class ReferrerResource < BaseResource
    def request_url
      "statistics/referrer"
    end

    def parse_response(body)
      JSON.parse(body).map{ |o| Referrer.new o }
    end
  end
end