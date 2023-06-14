module PirschApi
  class EventResource < BaseResource
    def request_url
      "statistics/events"
    end

    def parse_response(body)
      JSON.parse(body)&.map { |o| Event.new o }
    end
  end
end
