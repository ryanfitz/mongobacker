module MongoBacker
  class Configuration
    attr_accessor :host, :port, :access_key_id, :secret_access_key, :mongodump, :bucket
      
    def initialize(*args)
      unless args.empty?
        config = YAML.load_file(args[0])
        @host = config["mongo"]["host"]
        @port = config["mongo"]["port"]
        @mongodump = config["mongo"]["mongodump"]
        @access_key_id = config["s3"]["access_key_id"]
        @secret_access_key = config["s3"]["secret_access_key"]
        @bucket = config["s3"]["bucket"]
      end
      
      rescue Errno::ENOENT
        raise ArgumentError, "file not found at #{args[0]}"
        
    end
    
  end
end