# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tivo_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "tivo_helper"
  spec.version       = TivoHelper::VERSION
  spec.authors       = ["Brie Coyle"]
  spec.email         = ["brie.coyle@gmail.com"]

  spec.summary       = "This CLI app will provide you with the list up upcoming television premieres for maximum DVR efficiency. Information about upcoming shows is taken from Metacritic's permanent calendar."
  spec.homepage      = "https://github.com/briecoyle/tivo-helper-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "open-uri", ">= 0"
end
