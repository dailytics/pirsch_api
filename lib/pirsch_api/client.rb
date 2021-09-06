# frozen_string_literal: true

module PirschApi
  class Client
    
    BASE_URL = 'https://api.pirsch.io/api/v1'

    def initialize(client_id:, client_secret:)
      @client_id     = client_id.to_s
      @client_secret = client_secret.to_s
    end

    def valid?
      true if token rescue false
    end

    def token
      @token ||= TokenResource.new(@client_id, @client_secret).run
    end

    def domains
      DomainResource.new(client: self).run
    end

    def visitors(filters: {}, domain:)
      VisitorResource.new(client: self, filters: filters, domain: domain).run
    end

    def pages(filters: {}, domain:)
      PageResource.new(client: self, filters: filters, domain: domain).run
    end

    def referrers(filters: {}, domain:)
      ReferrerResource.new(client: self, filters: filters, domain: domain).run
    end

    def active(filters: {}, domain:)
      ActiveResource.new(client: self, filters: filters, domain: domain).run
    end

    def growth(filters: {}, domain:)
      GrowthResource.new(client: self, filters: filters, domain: domain).run
    end

    def events(filters: {}, domain:)
      EventResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_source(filters: {}, domain:)
      UtmSourceResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_medium(filters: {}, domain:)
      UtmMediumResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_campaign(filters: {}, domain:)
      UtmCampaignResource.new(client: self, filters: filters, domain: domain).run
    end
  end
end