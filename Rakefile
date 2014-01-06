require 'bundler'
require 'rake'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks


unless ENV['RESROBOT_API_KEY'].nil? || ENV['RESROBOT_STOPS_API_KEY'].nil? || ENV['STATIONSINFO_API_KEY'].nil?
  RSpec::Core::RakeTask.new(:spec)
  desc "Run specs"
  task :test => :spec
else
  task :test do
    puts "The API keys needed to run the tests are not defined."
  end
end

task :default => :test
