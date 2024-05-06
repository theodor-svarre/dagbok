def new_file()
    year = Time.now.strftime("%y")
    month = Time.now.strftime("%m")

    # Dir.chdir(year)
    Dir.chdir("years/#{year}")
    # dir = File.dirname(month)
    print "title: "
    title = gets.chomp+Time.now.strftime(" [%d-%m-%Y]")
    new_f = File.open(title, "w")
    print "write about your day - press enter to confirm: "
    content = gets.chomp
    new_f.puts(title+"\n"+"\n"+content)
    new_f.close
end

def date_check()
    year = Time.now.strftime("%y")
    month = Time.now.strftime("%m")

    if Dir.exist?("years/#{year}") == false
        Dir.mkdir("years/#{year}")
    end

    if Dir.exist?("years/#{year}/#{month}") == false
        Dir.mkdir("years/#{year}/#{month}")
    end

end

def new_folder()

    year = Time.now.strftime("%y")
    month = Time.now.strftime("%m")

    date_check(year)
    Dir.chdir(year)
    date_check(month)

end

def create_file(path, extension)
    dir = File.dirname(path)
  
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
  
    path << ".#{extension}"
    File.new(path, 'w')
  end


def kombo()
    new_folder()
    new_file()
end

def read()
    puts "välj mellan följande år:"
    puts Dir.entries("years") 
    input = gets.chomp
    
    puts Dir.entries("years/#{input}") 
end

print read()