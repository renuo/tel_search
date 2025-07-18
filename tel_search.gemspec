# frozen_string_literal: true

require_relative "lib/tel_search/version"

Gem::Specification.new do |spec|
  spec.name = "tel_search"
  spec.version = TelSearch::VERSION
  spec.authors = ["Liberatys", "Raphael Nestler"]
  spec.email = ["nick.flueckiger@renuo.ch", "raphael.nestler@renuo.ch"]

  spec.summary = "A ruby wrapper for the tel.search.ch/api endpoint"
  spec.description = "A ruby wrapper for the tel.search.ch/api endpoint"
  spec.homepage = "https://github.com/renuo/tel_search"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/renuo/tel_search"
  spec.metadata["changelog_uri"] = "https://github.com/renuo/tel_search/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", ">= 1.16.5"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "standard", "~> 1.33"
  spec.add_development_dependency "webmock", "~> 3.19"
  spec.add_development_dependency "vcr", "~> 6.3"
end
