$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'json_logger/version'

Gem::Specification.new do |s|
  s.name = 'json_logger'
  s.version = JsonLogger::VERSION
  s.authors = ['Alex Dean']
  s.email = 'github@mostlyalex.com'
  s.summary = 'Simple structured logging.'
  s.description = "A subclass of Ruby's standard `Logger` which makes it " \
    'easy to write structured data to your log files.'

  s.files = Dir['lib/**/*', 'LICENSE', 'Rakefile', 'README.md', 'CHANGELOG.md']
  s.test_files = Dir['spec/**/*']
  s.homepage = 'https://github.com/alexdean/json_logger'
  s.licenses = ['MIT']
  s.require_paths = ['lib']

  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency 'timecop', '>= 0'
  s.add_development_dependency 'bundler-audit'
  s.add_development_dependency 'rubocop', '~> 0.49.0'
  s.add_development_dependency 'rubocop-checkstyle_formatter', '~> 0.2.0'
  s.add_development_dependency 'ci_reporter_rspec', '~> 1.0.0'
end
