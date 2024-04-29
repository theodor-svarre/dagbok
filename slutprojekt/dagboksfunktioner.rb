def new_file()
    print "title: "
    title = gets.chomp+Time.now.strftime(" [%d-%m-%Y]")
    new_f = File.open(title, "w")
    print "write about your day - press enter to confirm: "
    content = gets.chomp
    new_f.puts(title+"\n"+"\n"+content)
    new_f.close
end

def date_check(time)
    year = Time.now.strftime("%y")
    month = Time.now.strftime("%m")

    if Dir.exist?(time) == false
        print Dir.exist?(time)
        Dir.mkdir(time)
    end
    # Dir.chdir(year)
    # Dir.mkdir(month)

end

def new_folder()

    year = Time.now.strftime("%y")
    month = Time.now.strftime("%m")

    date_check(year)
    Dir.chdir(year)
    date_check(month)

end




def kombo()
    new_folder()
    new_file()
end

def read()
    puts Dir.entries("slutprojekt/years") 
end

print read()