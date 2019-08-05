# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trailblazer_gen/version'

Gem::Specification.new do |spec|
  spec.name          = 'trailblazer_gen'
  spec.version       = TrailblazerGen::VERSION
  spec.authors       = ['Murat Bastas']
  spec.email         = ['muratbsts@gmail.com']

  spec.summary       = 'trailblazer generators for Rails >= 4.0'
  spec.description   = 'This gem provides some trailblazer(operation / contract)' \
                       'class generators for your Rails apps'
  spec.homepage      = 'https://github.com/murat/trailblazer_gen'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 4.0.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
end
