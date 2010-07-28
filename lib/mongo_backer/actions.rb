module MongoBacker
  module Actions
    include Thor::Actions

    def ask_with_default (msg, default_value)
     answer = ask(msg + "(#{default_value})")
 
     if answer.nil? or answer.empty?
       answer = default_value
     end
 
     answer
    end

    def run_mongodump(config)
      time = Time.new.strftime("%Y_%m_%d_%H-%M-%S")
      backup_dir = "#{Dir.tmpdir}/mongodbump_#{time}"
      
      run("#{config.mongodump} -o #{backup_dir}")
      
      backup_dir
    end
    
    def gzip_directory(dir)
      zip_file = "#{dir}.tar.gz"
      run("tar -czf #{zip_file} #{dir}")
      
      zip_file
    end
    
    def upload_to_s3(file, config)
      manager = MongoBacker::S3Manager.new config
      
      manager.upload_file file
    end
    
  end
end