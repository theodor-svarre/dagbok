def new_file()
    print "title: "
    title = gets.chomp+Time.now.strftime(" [%d-%m-%Y]")
    new_f = File.open(title, "w")
    print "write about your day - press enter to confirm: "
    content = gets.chomp
    new_f.puts(title+"\n"+"\n"+content)
    new_f.close
end

def date_check()


end

def new_folder()
    i = 0
    year_list = [2021, 2022, 2023, 2022]
    year = Time.now.strftime("%y")
    while i < year_list.length
        if year_list[i] != year
            Dir.mkdir(year)
            year_list.append(year)
        else
            i += 1
        end

    end

    month = Time.now.strftime("%m")
    m = Time.now.strftime("%m")

end


puts new_folder()