path = File.expand_path(File.dirname(__FILE__))

def command?(name)
  `which #{name}`
  $?.success?
end

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG['host_os']) != nil
  end

  def OS.mac?
   (/darwin/ =~ RbConfig::CONFIG['host_os']) != nil
  end

  def OS.unix?
    !OS.windows?
  end
  
  def OS.linux?
    OS.unix? and not OS.mac?
  end
end

File.open(File.join(path,"Rakefile"),"w") do |rakefile|
  
  if OS.windows? == true
    puts "Sorry, still no support is provided for your OS!" 
  
  elsif OS.mac? == true
    if command?("mvn")==false && command?("brew")==true
      rakefile.write <<-RAKE
        task :brew_install do
          sh "brew install maven"
        end
        task :default => [:brew_install]
      RAKE
    elsif command?("brew")==false
      rakefile.write <<-RAKE
      task :ok_inst do
        puts "Sorry, Maven could not be installed. Try installing 'brew' first"
      end
      task :default => [:ok_inst]
RAKE
    else
      rakefile.write <<-RAKE
    task :ok_inst do
      puts "Maven has been detected on your system"
    end
    task :default => [:ok_inst]
RAKE
    end
  elsif OS.linux? == true
    if command?("mvn")==false
      rakefile.write <<-RAKE
  	    task :apt_install do
          sh "sudo apt-get install maven2"
        end
        task :default => [:apt_install]
      RAKE
    else
      rakefile.write <<-RAKE
    task :ok_inst do
      puts "Maven has been detected on your system"
    end
    task :default => [:ok_inst]
RAKE
    end
  end
end



