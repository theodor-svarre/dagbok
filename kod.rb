def dagobok(svar)
    while 1 > 0 
        i = 1 

        if svar.downcase == "stäng dagboken"
            return ":("
        end 

        while svar.downcase != "ny sida" && svar.downcase != "läs gammal"
            puts "Jag upprepar, ny sida eller läs gammal?"
            svar = gets.chomp
        end 
    
        if svar.downcase == "ny sida"
            puts "Vad ska den heta? Om du ångrar dig, skriv färdig"
              title = gets.chomp + " " + Time.now.strftime("[%d-%m-%Y]")
            if title.downcase != "färdig"
                if i > 0 
                  new_file = File.open("#{title}.txt", "w")
                end 
                puts "Skri om din dag, tryck på enter för att bekräfta:"
                new_file.puts(title +"\n"+"\n")
                while i > 0
                    ny_text = gets.chomp
                    if ny_text == "färdig"
                        i = 0 
                    end 
                    if i == 1 
                        new_file.puts(ny_text)
                    end 
                end 
                new_file.close
            end 
        end 

        if svar.downcase == "läs gammal"
            puts "Vad heter den? Om du ångrar dig, skriv färdig"
            sida = gets.chomp
            if sida.downcase != "färdig"
               puts "Nu kan du skriva och om du känner dig färdig, skriv färdig"
               page = File.open("#{sida}.txt", "r")
               puts page.read()
               page.close()
               page = File.open("#{sida}.txt", "a")
                 while i > 0 
                  ny_text = gets.chomp 
                  if ny_text == "färdig"
                      i = 0 
                  end 
                  if i == 1 
                     page.puts(ny_text)
                  end
            end 
            page.close()
            end 
        end 

        puts "Ny sida eller läs gammal"
        svar = gets.chomp
        
    end 
end 

puts "Ny sida eller läs gammal"
svar = gets.chomp
puts dagobok(svar)
    