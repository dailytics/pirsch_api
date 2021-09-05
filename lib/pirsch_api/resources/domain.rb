module PirschApi
  class DomainResource < BaseResource
    def request_url
      "domain"
    end

    def parse_response(body)
      puts body
      JSON.parse(body).map{ |o| Domain.new o }
    end
  end
end