require_relative 'lib/pirsch_api/version'

Gem::Specification.new do |spec|
  spec.name          = "pirsch_api"
  spec.version       = PirschApi::VERSION
  spec.authors       = ["Gustavo Garcia"]
  spec.email         = ["gustavo@dailytics.com"]

  spec.summary       = 'A simple Pirsch Analytics API wrapper for Rails'
  spec.description   = 'A very humble wrapper for the API by Pirsch.io'
  spec.homepage      = "https://github.com/dailytics/pirsch_api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dailytics/pirsch_api"
  spec.metadata["changelog_uri"] = "https://github.com/dailytics/pirsch_api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
