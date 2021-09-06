require 'json'
require "net/http"
require "uri"
require "cgi"

require 'pirsch_api/version'

module PirschApi
  autoload :Client, "pirsch_api/client"
  autoload :Error, "pirsch_api/error"

  autoload :BaseResource, "pirsch_api/resources/base"
  autoload :TokenResource, "pirsch_api/resources/token"
  autoload :DomainResource, "pirsch_api/resources/domain"
  autoload :VisitorResource, "pirsch_api/resources/statistics/visitor"
  autoload :PageResource, "pirsch_api/resources/statistics/page"
  autoload :ReferrerResource, "pirsch_api/resources/statistics/referrer"
  autoload :ActiveResource, "pirsch_api/resources/statistics/active"
  autoload :GrowthResource, "pirsch_api/resources/statistics/growth"
  autoload :EventResource, "pirsch_api/resources/statistics/event"
  autoload :UtmSourceResource, "pirsch_api/resources/statistics/utm_source"
  autoload :UtmCampaignResource, "pirsch_api/resources/statistics/utm_campaign"
  autoload :UtmMediumResource, "pirsch_api/resources/statistics/utm_medium"

  autoload :Object, "pirsch_api/object"
  autoload :Token, "pirsch_api/objects/token"
  autoload :Domain, "pirsch_api/objects/domain"
  autoload :Visitor, "pirsch_api/objects/visitor"
  autoload :Page, "pirsch_api/objects/page"
  autoload :Referrer, "pirsch_api/objects/referrer"
  autoload :Active, "pirsch_api/objects/active"
  autoload :Growth, "pirsch_api/objects/growth"
  autoload :Event, "pirsch_api/objects/event"
  autoload :UtmSource, "pirsch_api/objects/utm_source"
  autoload :UtmCampaign, "pirsch_api/objects/utm_campaign"
  autoload :UtmMedium, "pirsch_api/objects/utm_medium"
end
