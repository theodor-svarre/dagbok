def new_file()
    # Beskrivning:         Hjälpfunktion som skapar nya filer 
    # Variabel 1:          String - Variabel kallad "title" och avgör titel på anteckning
    # Variabel 2:          String - Variabel kallad "new_content" som sparar en string man får från gets.chomp. Adderas med den tomma variabeln "content"
    # Variabel 3:          String - Variabel kallad "content" som sparar variabeln "new_content"s string
    # Return:              String - När koden får in inputen "/stäng" avslutas hjälpfunktionen efter att ha sparat koden i rätt folder
    # Exempel:  
    
    # "Titel:"       
    # input: "En fin titel 2353562"
    # "Berätta om din dag! - skriv '/stäng': "
    # input: "Bla bla bla"
    # det här är vad jag vill skriva 5526356.24656?
    # /stäng
    # Filen har nu skapats och sparas i rätt folder under titeln "En fin titel 2353562 [dag-månad-år]"   
    
    # Exempel 2:
    
    # Koden tillåter även tecken i titeln
    # "Titel:"       
    # input: "E??!:"
    # titel: "E??!:
    
    
    # Datum:               06-05-2024
    # Namn:                Vile Kindstrand, Theodor Svarre
        original_directory = Dir.pwd #sparadar den ursprungliga sökvägen
        date_check()
        year = Time.now.strftime("%Y")
        month = Time.now.strftime("%m")
    
        Dir.chdir("years/#{year}/#{month}")
        
        puts "Title:"
        title = gets.chomp.gsub(/[^0-9A-Za-z\s]/, '') + Time.now.strftime(" [%d-%m-%Y]") # Med .gsub(/[^0-9A-Za-z\s]/, '') kan man även skriva ? som en titel.
        new_f = File.open(title, "w")
        puts "Berätta om din dag! - skriv '/stäng': "
    
        content = ""

        i = 1 
    
        while i > 0 
            new_content = gets.chomp
            if new_content == "/stäng"
                i = 0
            else
                content += new_content + "\n"
            end 
        end 
        new_f.puts(title+"\n"+"\n"+content)
        new_f.close
        Dir.chdir(original_directory) #Kallar fram till den ursprungliga sökvägen, years
    end

    #----------------------------------------------------------------------------
    
    def date_check()
# Beskrivning:         Hjälpfunktion som kollar vilket datum det är. Om en folder med sagda datum inte finns skapar den det
# Variabel 1:          String - "year" Tar ut vilket år det är m.h.a Time.now.strftime() metod
# Variabel 2:          String - "month" Tar ut vilken månad det är m.h.a Time.now.strftime() metod
# Argument 1:          Klass - Vi använder oss ej av argument i den här funktionen eftersom att de enda variablerna är beroende av tiden, vilket hämtas i början av funktionen. 

# Return:              Om folders med datum ej finns (år respektive månad) skapas nödvändiga folders, annars sker ingenting

# Exempel:  
# puts Dir.exist?("years/#{year}") ==> False ==> skapar ny folder för år
# puts Dir.exist?("years/#{year}/#{month}") ==> True ==> skip





# Datum:               06-05-2024
# Namn:                Vile Kindstrand, Theodor Svarre
        year = Time.now.strftime("%Y")
        month = Time.now.strftime("%m")
    
        if Dir.exist?("years/#{year}") == false
            Dir.mkdir("years/#{year}")
        end
    
        if Dir.exist?("years/#{year}/#{month}") == false
            Dir.mkdir("years/#{year}/#{month}")
        end
        
    end

#----------------------------------------------------------------------------

    def read()
# Beskrivning:         Hjälpfunktion som kollar vilket datum det är. Om en folder med sagda datum inte finns skapar den det
# Variabel 1:          String - "year" Tar ut vilket år det är m.h.a Time.now.strftime() metod
# Variabel 2:          String - "month" Tar ut vilken månad det är m.h.a Time.now.strftime() metod
# Argument:          Klass - Vi använder oss ej av argument i den här funktionen eftersom att de enda variablerna är beroende av tiden, vilket hämtas i början av funktionen. 

# Return:              Om folders med datum ej finns (år respektive månad) skapas nödvändiga folders, annars sker ingenting

# Exempel:  

# välj mellan följande år:
# .
# ..
# 2022
# 2024
# input: 2300
# År 2300 finns inte. Försök igen.
# välj mellan följande år:        
# .
# ..
# 2022
# 2024
# input: ergergf
# År ergergf finns inte. Försök igen.
# välj mellan följande år:
# .
# ..
# 2022
# 2024
# input: ?(#/¤&
# År ?(#/¤& finns inte. Försök igen.
# välj mellan följande år:
# .
# ..
# 2022
# 2024
# input: 2024
# välj mellan följande månader:
# .
# ..
# 05
# input: 05
# välj mellan följande sidor:
# .
# ..
# rumpnisse [06-05-2024]
# test1 [06-05-2024]
# Vileh [06-05-2024]
# input: Vileh [06-05-2024]
# den här dagen skrev du följande:
# Vileh [06-05-2024]
#  (innehåll nedan)
# Jätebra



# Datum:               06-05-2024
# Namn:                Vile Kindstrand, Theodor Svarre
    
        i = 0 
    
        while i == 0 
            puts "välj mellan följande år:"
            puts Dir.entries("years/") 
            y_input = gets.chomp
    
            if Dir.entries("years/").include?(y_input)
                i = 1
            else
                puts "År #{y_input} finns inte. Försök igen."
            end
        end 
    
        i = 0
    
        while i == 0 
            puts "välj mellan följande månader:"
            puts Dir.entries("years/#{y_input}") 
            m_input = gets.chomp
    
            if Dir.entries("years/#{y_input}").include?(m_input)
                i = 1
            else
                puts "Månad #{m_input} finns inte. Försök igen."
            end
        end 
    
        i = 0 
    
        while i == 0 
            puts "välj mellan följande sidor:"
            puts Dir.entries("years/#{y_input}/#{m_input}") 
            d_input = gets.chomp
        
            if Dir.entries("years/#{y_input}/#{m_input}").include?(d_input) 
                i = 1 
            else 
                puts "Sidan #{d_input} finns inte. Försök igen"
            end 
        end 
    
        # Öppna filen för läsning (läget 'r' står för "read")
        puts "den här dagen skrev du följande:"
        File.open("years/#{y_input}/#{m_input}/#{d_input}", "r") { |file|
            # Läs varje rad i filen och skriv ut den till terminalen
            file.each_line { |line|
            puts line
            }
        } 
    end
    
    #----------------------------------------------------------------------------
    
    def dagbok()
    
        puts "Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
        svar = gets.chomp
        run_state = true
        while run_state == true
    
            if svar.downcase == "/stäng"
                run_state == false 
                return
            end 
    
            while svar.downcase != "/ny" && svar.downcase != "/läs"
                puts "Fel input! Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
                svar = gets.chomp
            end 
        
            if svar.downcase == "/ny"
                new_file()
    
            end 
           
        
            if svar.downcase == "/läs"
                read()
    
            end 
            puts "Skriv '/ny' för att skapa ny skrivt och '/läs' för att läsa gamla"
            svar = gets.chomp
        end 
    end 
    
    puts dagbok()
    