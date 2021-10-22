# frozen_string_literal: true

require_relative "lib/tel_search/version"

Gem::Specification.new do |spec|
  spec.name = "tel_search"
  spec.version = TelSearch::VERSION
  spec.authors = ["Liberatys"]
  spec.email = ["nick.flueckiger@renuo.ch"]

  spec.summary = "A ruby wrapper for the tel.search.ch/api endpoint"
  spec.description = "A ruby wrapper for the tel.search.ch/api endpoint"
  spec.homepage = "https://github.com/renuo/tel_search"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/renuo/tel_search"
  spec.metadata["changelog_uri"] = "https://github.com/renuo/tel_search/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
