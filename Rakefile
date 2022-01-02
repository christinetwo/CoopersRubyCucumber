require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# command line options here https://cucumber.io/docs/tools/ruby/
# ro tun rake apionly,  rake features or rake uionly
# see cucumber.yml for options for more options https://cucumber.io/docs/cucumber/configuration/#profiles

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

Cucumber::Rake::Task.new(:apionly) do |t|
  t.profile = 'apionly'
end

Cucumber::Rake::Task.new(:uionly) do |t|
  t.profile = 'uionly'
end

task :default => :features

