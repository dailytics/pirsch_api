module PirschApi
  class UtmCampaignResource < BaseResource
    def request_url
      "statistics/utm/campaign"
    end
    
    def parse_response(body)
      JSON.parse(body)&.map{ |o| UtmCampaign.new o }
    end
  end
end