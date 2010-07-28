require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MongoBacker::Configuration do

  it "correctly reads all settings from valid yaml config" do
    config = MongoBacker::Configuration.new File.expand_path(File.dirname(__FILE__) + '/fixtures/valid_config.yml')
  
    config.host.should eq "localhost"
    config.port.should eq 27017
    config.mongodump.should eq "/usr/bin/mongodump"
    config.bucket.should eq "mongo_backup"
    config.access_key_id.should eq 123
    config.secret_access_key.should eq "asdf"
  end
    
  it "raises exception when yaml file is not found" do
    lambda { MongoBacker::Configuration.new("i_dont_exist.yml") }.should raise_error(ArgumentError)
  end
  
  it "has default constructor" do
    MongoBacker::Configuration.new.should_not be_nil
  end

end