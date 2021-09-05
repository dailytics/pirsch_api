# frozen_string_literal: true

require 'pirsch_api/token'
require 'pirsch_api/base'
require 'pirsch_api/domain'

require 'json'
require "net/http"
require "uri"
require "cgi"

module PirschApi
  class Client
    
    BASE_URL = 'https://api.pirsch.io'

    def initialize(client_id, client_secret)
      @client_id     = client_id.to_s
      @client_secret = client_secret.to_s
    end

    def token
      PirschApi::Token.new(@client_id, @client_secret).run
    end

    def domains
      @domains ||= PirschApi::Domain.new(token).run
    end

    def valid?
      true if token rescue false
    end
  end
end