$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'json_logger/version'

Gem::Specification.new do |spec|
  spec.name = 'json_logger'
  spec.version = JsonLogger::VERSION
  spec.authors = ['Alex Dean']
  spec.email = 'github@mostlyalex.com'
  spec.summary = 'Simple structured logging.'
  spec.description = "A subclass of Ruby's standard `Logger` which makes it " \
    'easy to write structured data to your log files.'

  spec.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md', 'CHANGELOG.md']
  spec.test_files = Dir['spec/**/*']
  spec.homepage = 'https://github.com/alexdean/json_logger'
  spec.licenses = ['MIT']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3.0'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'timecop', '>= 0'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency "rubocop",  ">= 0.91.0"
  spec.add_development_dependency "ted_rubocop_rules"
  spec.add_development_dependency 'rubocop-checkstyle_formatter', '~> 0.2.0'
  spec.add_development_dependency 'ci_reporter_rspec', '~> 1.0.0'
  spec.add_development_dependency "byebug"
end
