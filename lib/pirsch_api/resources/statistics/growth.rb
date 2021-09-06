module PirschApi
  class GrowthResource < BaseResource
    def request_url
      "statistics/growth"
    end

    def parse_response(body)
      Growth.new JSON.parse(body)
    end
  end
end