require 'rake'
require "rspec/core/rake_task"
require File.dirname(__FILE__) + "/lib/mongo_backer/version"

RSpec::Core::RakeTask.new(:spec)

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "mongo_backer"
    gemspec.version = MongoBacker::Version
    gemspec.summary = "command line tool to backup mongoDB databases to s3"
    gemspec.description = "mongo backer uses mongodump to perform backups on a live running mongodb instance and then zips and uploads the backup to s3"
    gemspec.email = "ryan.fitz1@gmail.com"
    gemspec.homepage = "http://github.com/ryanfitz/mongobacker"
    gemspec.authors = ["Ryan Fitzgerald"]
    
    gemspec.add_dependency('aws-s3', '>= 0.6.2')
    gemspec.add_dependency('thor', '>= 0.13.8')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end