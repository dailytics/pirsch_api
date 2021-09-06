module PirschApi
  class VisitorResource < BaseResource
    def request_url
      "statistics/visitor"
    end

    def parse_response(body)
      JSON.parse(body).map{ |o| Visitor.new o }
    end
  end
end