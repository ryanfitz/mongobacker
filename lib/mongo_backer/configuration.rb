module MongoBacker
  class Configuration
    attr_accessor :host, :port, :access_key_id, :secret_access_key
   
    def initialize(config_file)
      begin
        config = YAML.load_file(config_file)
      rescue Errno::ENOENT
        raise ArgumentError, "file not found at #{config_file}"
      end
      
      @host = config["mongo"]["host"]
      @port = config["mongo"]["port"]
      @access_key_id = config["s3"]["access_key_id"]
      @secret_access_key = config["s3"]["secret_access_key"]
    end
  end
  
end