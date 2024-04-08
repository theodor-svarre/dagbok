puts "Ny sida eller läs gammal"
svar = gets.chomp

if svar == "Ny sida"
    print "title:"
        title = gets.chomp+Time.now.strftime()
        new_f = File.open(title, "w")
        print "fsuif"
        content = gets.chomp
        new_f.puts(title"\n"+content)
        new_f.close 
end 

if svar == "läs gammal"
    puts "vilken sida"
    sida = gets.chomp
    File.foreach("#{sida}.txt") { |line| puts line }
end 


