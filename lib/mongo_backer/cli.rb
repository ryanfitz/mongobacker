require 'thor'
require 'yaml'

module MongoBacker
  class Cli < Thor
    include Thor::Actions
    include MongoBacker::Actions
    
    def self.source_root
      File.dirname(__FILE__)
    end
     
    map "-v" => "version"                                                                             
    desc "-v", "mongobacker version"
    def version()
        puts "mongobacker version #{MongoBacker::VERSION::STRING}"
    end
    
    desc "setup", "create new configuration file"
    def setup
      @host = ask_with_default("mongo host: ", "localhost")
      @port = ask_with_default("mongo port: ", "27017")
      @access_key_id = ask("s3 access key id")
      @secret_access_key = ask("s3 secret access key")
      
      template('templates/config.tt', "configuration.yml")
    end
    
    desc "backup", "backup mongodb to s3"
    method_option :config, :type => :string, :aliases => "-c", :required => true,
                  :desc => "Path to mongo backer config file"
    def backup

    end
    
    # def help
    #   puts "helpppppp"
    # end
    
  end

end