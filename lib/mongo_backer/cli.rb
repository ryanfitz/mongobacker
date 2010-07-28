require 'tmpdir'

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
      @mongodump = ask_with_default("mongodump path: ", "/usr/bin/mongodump")
      @access_key_id = ask("s3 access key id:")
      @secret_access_key = ask("s3 secret access key:")
      
      template('templates/config.tt', "configuration.yml")
    end
    
    desc "backup", "backup mongodb to s3"
    method_option :config, :type => :string, :aliases => "-c", :required => true,
                  :desc => "Path to mongo backer config file"
    def backup
      config = MongoBacker::Configuration.new options[:config]
      
      backup_dir = run_mongodump(config)
      
      backup_file = gzip_directory(backup_dir)
      
      upload_to_s3(backup_file, config)
      
      FileUtils.rm_rf backup_dir
      FileUtils.rm backup_file
    end
    
    desc "list", "list backups currently in s3"
    method_option :config, :type => :string, :aliases => "-c", :required => true,
                  :desc => "Path to mongo backer config file"
    def list
      config = MongoBacker::Configuration.new options[:config]
      list_backups config
    end
    
    # def help
    #   puts "helpppppp"
    # end
  end

end