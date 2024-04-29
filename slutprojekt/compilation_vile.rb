

def new_file()
    i = 1
    print "titel: "
    title = gets.chomp+Time.now.strftime(" [%d-%m-%Y]")
    new_f = File.open(title, "w")
    print "Berätta om din dag! - skriv '/stäng': "

    while i > 0 
        content = ""
        new_content = gets.chomp
        if new_content == "/stäng"
        end 
        if i == 1 
        content += new_content
        end 
    end 
    new_f.puts(title+"\n"+"\n"+content)
    new_f.close
end

###############################################################################################

def dagobok(svar)
    run_state = true
    while run_state == true

        if svar.downcase == "/stäng dagboken"
            run_state == false 
            return
        end 

        while svar.downcase != "/ny" && svar.downcase != "/läs"
            puts "Fel input! Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
            svar = gets.chomp
        end 
    
        if svar.downcase == "/ny"
            new_file()
            # #Skapar ny sida
            # puts "Vad ska den heta?"
            #     title = gets.chomp
            #     new_file = File.open("#{title}.txt", "w")
            #     #ser efter när texten ska stängas och sparas
            #     while i > 0 
            #         ny_text = gets.chomp 
            #         if ny_text == "stäng sidan"
            #         end 
            #         if i == 1 
            #         new_file.puts(ny_text)
            #         end 
            #     end 
            #     new_file.close 
        end 
       
    
        if svar.downcase == "/gammal"
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
        puts "Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
        svar = gets.chomp
    end 
end 

puts "Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
svar = gets.chomp
puts dagobok(svar)
    