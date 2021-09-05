# frozen_string_literal: true

module PirschApi
  class Client
    
    BASE_URL = 'https://api.pirsch.io/api/v1'

    def initialize(client_id, client_secret)
      @client_id     = client_id.to_s
      @client_secret = client_secret.to_s
    end

    def token
      TokenResource.new(@client_id, @client_secret).run
    end

    def domains
      @domains ||= DomainResource.new(token.access_token).run
    end

    def valid?
      true if token rescue false
    end
  end
end