require 'json'
require "net/http"
require "uri"
require "cgi"

require 'pirsch_api/version'

module PirschApi
  autoload :Client, "pirsch_api/client"
  autoload :Object, "pirsch_api/object"
  
  autoload :Error, "pirsch_api/error"

  autoload :BaseResource, "pirsch_api/resources/base"
  autoload :TokenResource, "pirsch_api/resources/token"
  autoload :DomainResource, "pirsch_api/resources/domain"

  autoload :Token, "pirsch_api/objects/token"
  autoload :Domain, "pirsch_api/objects/domain"
end
