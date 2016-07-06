# don't release to rubygems when doing 'rake release'
ENV['gem_push'] = 'no'

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
desc 'Run all specs in spec directory (excluding plugin specs)'
RSpec::Core::RakeTask.new(:spec)

if ENV['COVERAGE']
  require 'ci/reporter/rake/rspec'
  task spec: 'ci:setup:rspec'
end
