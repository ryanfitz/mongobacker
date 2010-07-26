module MongoBacker
  class Configuration
    attr_accessor :host, :port, :access_key_id, :secret_access_key
      
    def initialize(config_file)
      config = YAML.load_file(config_file)
      @host = config["mongo"]["host"]
      @port = config["mongo"]["port"]
      @access_key_id = config["s3"]["access_key_id"]
      @secret_access_key = config["s3"]["secret_access_key"]
      
      rescue Errno::ENOENT
        raise ArgumentError, "file not found at #{config_file}"
    end
    
  end
end