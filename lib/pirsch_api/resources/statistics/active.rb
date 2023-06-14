module PirschApi
  class ActiveResource < BaseResource
    def request_url
      "statistics/active"
    end

    def parse_response(body)
      Active.new JSON.parse(body)
    end
  end
end
