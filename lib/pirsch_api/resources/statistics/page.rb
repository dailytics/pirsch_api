module PirschApi
  class PageResource < BaseResource
    def request_url
      "statistics/page"
    end

    def parse_response(body)
      JSON.parse(body).map{ |o| Page.new o }
    end
  end
end