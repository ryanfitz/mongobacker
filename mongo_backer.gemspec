require File.expand_path('../lib/mongo_backer/version', __FILE__)

Gem::Specification.new do |s|
  s.name               = 'mongo_backer'
  s.homepage           = 'gohealth.io'
  s.summary            = 'command line tool to backup and restore mongoDB databases using s3 '
  s.require_path       = 'lib'
  s.default_executable = 'mongobacker'
  s.authors            = ['Ryan Fitzgerald']
  s.email              = ['ryan.fitz1@gmail.com']
  s.executables        = ['mongobacker']
  s.version            = MongoBacker::VERSION::STRING
  s.platform           = Gem::Platform::RUBY
  s.files              = Dir.glob("{bin,lib}/**/*") + %w[LICENSE README.rdoc]

  s.add_dependency 'thor',    '>= 0.13.8'
  s.add_dependency 'aws-s3',  '>= 0.6.2'
end