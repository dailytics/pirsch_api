module PirschApi
  class DurationPageResource < BaseResource
    def request_url
      "statistics/duration/page"
    end

    def parse_response(body)
      JSON.parse(body)&.map { |o| DurationPage.new o }
    end
  end
end
