require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# command line options here https://cucumber.io/docs/tools/ruby/
# to tun rake apionly,  rake features or rake uionly
# see cucumber.yml for options for more options https://cucumber.io/docs/cucumber/configuration/#profiles

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

Cucumber::Rake::Task.new(:api_only) do |t|
  t.profile = 'api_only'
end

Cucumber::Rake::Task.new(:ui_only) do |t|
  t.profile = 'ui_only'
end

Cucumber::Rake::Task.new(:ui_only_smoke_test) do |t|
  t.profile = 'ui_only_smoke_test'
end

task :default => :features

