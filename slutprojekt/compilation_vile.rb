


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

# Koden tillåter inte tecken i titeln
# "Titel:"       
# input: "E??!:" ==> "Fel uppstod! Använd ej tecken"
# titel:


# Datum:               06-05-2024
# Namn:                Vile Kindstrand, Theodor Svarre
    original_directory = Dir.pwd
    date_check()
    i = 1
    year = Time.now.strftime("%Y")
    month = Time.now.strftime("%m")

    Dir.chdir("years/#{year}/#{month}")
    print "titel: "
    title = gets.chomp+Time.now.strftime(" [%d-%m-%Y]")
    new_f = File.open(title, "w")
    puts "Berätta om din dag! - skriv '/stäng': "

    content = ""

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
    # Dir.getwd()
    # Dir.chdir("years/#{year}/#{month}")
    # Dir.chdir("../")
    # Dir.chdir("../")
    Dir.chdir(original_directory)

end

def date_check()
# Beskrivning:         Hjälpfunktion som kollar vilket datum det är. Om en folder med sagda datum inte finns skapar den det
# Variabel 1:          String - Tar ut vilket år det är m.h.a Time.now.strftime() metod
# Variabel 2:          String - Tar ut vilken månad det är m.h.a Time.now.strftime() metod

# Return:              Om datum stämmer 
# Exempel:  




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

def read()
    puts "välj mellan följande år:"
    puts Dir.entries("years/") 
    y_input = gets.chomp

    puts "välj mellan följande månader:"
    puts Dir.entries("years/#{y_input}") 
    m_input = gets.chomp
    

    puts "välj mellan följande anteckningar:"
    puts Dir.entries("years/#{y_input}/#{m_input}") 
    d_input = gets.chomp

    # Öppna filen för läsning (läget 'r' står för "read")
    puts "den här dagen skrev du följande:"
    File.open("years/#{y_input}/#{m_input}/#{d_input}", "r") { |file|
        # Läs varje rad i filen och skriv ut den till terminalen
        file.each_line { |line|
        puts line

        }
    } 
end

###############################################################################################

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
    