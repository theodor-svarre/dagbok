def dagobok(svar)
    while 1 > 0 
        i = 1 

        if svar.downcase == "stäng dagboken"
            return 
        end 

        while svar.downcase != "ny sida" && svar.downcase != "läs gammal"
            puts "Jag upprepar, ny sida eller läs gammal?"
            svar = gets.chomp
        end 
    
        if svar.downcase == "ny sida"
            puts "Vad ska den heta?"
                title = gets.chomp
                new_file = File.open("#{title}.txt", "w")
                while i > 0 
                    ny_text = gets.chomp 
                    if ny_text == "stäng sidan"
                    end 
                    if i == 1 
                    new_file.puts(ny_text)
                    end 
                end 
                new_file.close 
        end 
       
    
        if svar.downcase == "läs gammal"
            puts "vilken sida"
            sida = gets.chomp
            page = File.open("#{sida}.txt", "r")
            puts page.read()
            page.close()
            page = File.open("#{sida}.txt", "a")
            while i > 0 
                ny_text = gets.chomp 
                page.puts(ny_text)
                if ny_text == "stäng sidan"
                    i = 0 
                end 
            end 
            page.close()
          end 
        puts "Ny sida eller läs gammal"
        svar = gets.chomp
    end 
end 

puts "Ny sida eller läs gammal"
svar = gets.chomp
puts dagobok(svar)
    