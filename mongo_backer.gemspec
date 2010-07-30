# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongo_backer}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Fitzgerald"]
  s.date = %q{2010-07-30}
  s.default_executable = %q{mongobacker}
  s.description = %q{mongo backer uses mongodump to perform backups on a live running mongodb instance and then zips and uploads the backup to s3}
  s.email = %q{ryan.fitz1@gmail.com}
  s.executables = ["mongobacker"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "bin/mongobacker",
     "lib/mongo_backer.rb",
     "lib/mongo_backer/actions.rb",
     "lib/mongo_backer/cli.rb",
     "lib/mongo_backer/configuration.rb",
     "lib/mongo_backer/s3_manager.rb",
     "lib/mongo_backer/templates/config.tt",
     "lib/mongo_backer/version.rb",
     "mongo_backer.gemspec",
     "spec/configuration_spec.rb",
     "spec/fixtures/valid_config.yml",
     "spec/s3_manager_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/ryanfitz/mongobacker}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{command line tool to backup mongoDB databases to s3}
  s.test_files = [
    "spec/configuration_spec.rb",
     "spec/s3_manager_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-s3>, [">= 0.6.2"])
      s.add_runtime_dependency(%q<thor>, [">= 0.13.8"])
    else
      s.add_dependency(%q<aws-s3>, [">= 0.6.2"])
      s.add_dependency(%q<thor>, [">= 0.13.8"])
    end
  else
    s.add_dependency(%q<aws-s3>, [">= 0.6.2"])
    s.add_dependency(%q<thor>, [">= 0.13.8"])
  end
end

