module MongoBacker
  class S3Manager
    include AWS::S3
    
    attr_reader :bucket
    
    def initialize(config)
      AWS::S3::Base.establish_connection!(
         :access_key_id     => config.access_key_id,
         :secret_access_key => config.secret_access_key
       )
       
      @bucket = create_bucket config.bucket
    end
    
    def create_bucket(bucket)
      if Service.buckets.collect{ |b| b.name }.include?(bucket)
        bucket = Bucket.find(bucket)
      else
        bucket = Bucket.create(bucket)
      end
    end
    
    def upload_file(file)
      name = File.basename file
      
      puts "uploading file #{name} to bucket #{@bucket.name}"
      
      S3Object.store(name, open(file), @bucket.name)
      
      puts "finished uploading file"
    end
    
  end
  
end