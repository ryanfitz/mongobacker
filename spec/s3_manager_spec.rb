require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MongoBacker::S3Manager do
  
  before :each do
    @config = MongoBacker::Configuration.new
    @config.access_key_id = "some_key_id"
    @config.secret_access_key = "some_access_key"
    @config.bucket = "some_bucket"
    
    AWS::S3::Base.stub! :establish_connection!
  end
  
  it "creates new s3 bucket" do
    mock_s3_bucket_exists "another_bucket"
    expects_creates_new_s3_bucket @config.bucket
    expects_find_existing_bucket @config.bucket
    
    manager = MongoBacker::S3Manager.new @config
    manager.bucket.should eq @config.bucket
  end
  
  it "returns existing bucket that exists in s3" do
    mock_s3_bucket_exists @config.bucket
    expects_find_existing_bucket @config.bucket
    
    manager = MongoBacker::S3Manager.new @config
    manager.bucket.should eq @config.bucket
  end
  
  def mock_s3_bucket_exists(*names)
    mock_buckets = []
    
    names.each do |name|
      m = mock(name)
      m.should_receive(:name).once.and_return(name)
      
      mock_buckets << m
    end
    
    AWS::S3::Service.stub!(:buckets).and_return(mock_buckets)   
  end
  
  def expects_creates_new_s3_bucket(name)
    AWS::S3::Bucket.should_receive(:create).with(name).and_return name
  end
  
  def expects_find_existing_bucket(name)
    AWS::S3::Bucket.should_receive(:find).with(name).and_return name
  end

end