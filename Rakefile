# encoding: utf-8
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
  require 'jbundler'
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `jruby -S bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ruby-band"
  gem.homepage = "http://github.com/arrigonialberto86/ruby-band"
  gem.license = "MIT"
  gem.summary = %Q{Data mining algorithms for JRuby}
  gem.description = %Q{Data mining and machine learning algorithms for JRuby }
  gem.email = "arrigonialberto86@gmail.com"
  gem.authors = ["arrigonialberto86"]
  gem.extensions = ["ext/mkrf_conf.rb"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
#  test.pattern = 'test/**/test_*.rb'
  test.test_files = FileList['test/test_*.rb']
  test.verbose = true
end

task :test => [] do
  begin
    Rake::Task[:test].invoke
  rescue
  end
  Rake::Task[:features].invoke
end

#require 'rcov/rcovtask'
#Rcov::RcovTask.new do |test|
#  test.libs << 'test'
#  test.pattern = 'test/**/test_*.rb'
#  test.verbose = true
#  test.rcov_opts << '--exclude "gems/*"'
#end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-band #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
