# frozen_string_literal: true

module PirschApi
  class Client
    BASE_URL = "https://api.pirsch.io/api/v1"

    def initialize(client_id:, client_secret:)
      @client_id = client_id.to_s
      @client_secret = client_secret.to_s
    end

    def valid?
      true if token
    rescue
      false
    end

    def token
      @token ||= TokenResource.new(@client_id, @client_secret).run
    end

    def domains
      DomainResource.new(client: self).run
    end

    def visitors(domain:, filters: {})
      VisitorResource.new(client: self, filters: filters, domain: domain).run
    end

    def pages(domain:, filters: {})
      PageResource.new(client: self, filters: filters, domain: domain).run
    end

    def referrers(domain:, filters: {})
      ReferrerResource.new(client: self, filters: filters, domain: domain).run
    end

    def active(domain:, filters: {})
      ActiveResource.new(client: self, filters: filters, domain: domain).run
    end

    def growth(domain:, filters: {})
      GrowthResource.new(client: self, filters: filters, domain: domain).run
    end

    def events(domain:, filters: {})
      EventResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_source(domain:, filters: {})
      UtmSourceResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_medium(domain:, filters: {})
      UtmMediumResource.new(client: self, filters: filters, domain: domain).run
    end

    def utm_campaign(domain:, filters: {})
      UtmCampaignResource.new(client: self, filters: filters, domain: domain).run
    end

    def duration_session(domain:, filters: {})
      DurationSessionResource.new(client: self, filters: filters, domain: domain).run
    end

    def duration_page(domain:, filters: {})
      DurationPageResource.new(client: self, filters: filters, domain: domain).run
    end
  end
end
