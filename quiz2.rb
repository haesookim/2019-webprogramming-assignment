rubyCount = 5
javaCount = 5
pythonCount = 5
jSCount = 5

rubySold = 0
javaSold = 0
pythonSold = 0
jSSold = 0

title = "VendingReport"
timeVar = Time.now
title << timeVar.month.to_s
title << timeVar.day.to_s
title << ".txt"

file = File.new(title, "a+")

file.puts "\n--------\nNew session"+timeVar.to_s+"\n--------\n\n"
file.close()

totCount = rubyCount+javaCount+pythonCount+jSCount

while (true)
    file = File.new(title, "a+")
    puts "Welcome to the Ruby Vending Machine! type in 'quit' at any time to exit"
    puts "Here's what we have in stock:"

    business = true;

    if rubyCount > 0
        puts "Ruby: " + rubyCount.to_s
    end

    if javaCount >0
        puts "Java: " + javaCount.to_s
    end

    if pythonCount >0
        puts "Python: " + pythonCount.to_s
    end

    if jSCount >0
        puts "JavaScript: " + jSCount.to_s
    end

    puts ""
    print "What do you want? : "
    menu = gets().chomp()

    if menu == "quit"
        totalString = "In total we sold: " + rubySold.to_s + " Ruby, " + javaSold.to_s + " Java, " + pythonSold.to_s + " Python, " + jSSold.to_s + " JavaScript."
        file.puts totalString
        break
    end

    print "How many do you want?: "
    number = gets().chomp().to_i
    puts ""

    if number == "quit"
        totalString = "In total we sold: " + rubySold.to_s + " Ruby, " + javaSold.to_s + " Java, " + pythonSold.to_s + " Python, " + jSSold.to_s + " JavaScript."
        file.puts totalString
        break
    end

    if number <= 0
        business = false
        puts("Invalid order. Try again")
        puts ""
    end

    if menu.downcase == "ruby" && rubyCount-number >= 0
        rubyCount = rubyCount-number
        rubySold += number
    elsif menu.downcase =="java" && javaCount-number >= 0
        javaCount = javaCount-number
        javaSold += number
    elsif menu.downcase =="python" && pythonCount-number >= 0
        pythonCount = pythonCount-number
        pythonSold += number
    elsif menu.downcase =="javascript" && jSCount-number >= 0
        jSCount = jSCount -number
        jSSold += number
    else 
        puts("Invalid order. Try again")
        puts ""

        business = false
    end

    totCount = rubyCount+javaCount+pythonCount+jSCount

    if (business)
        puts "Here's your order. Enjoy!"
        puts ""

        text = "Sold "
        text << number.to_s
        text << " "
        text << menu

        file.puts (text)
    end

    if (totCount == 0)
        puts("We are out of stock : refilling")
        rubyCount = 5
        javaCount = 5
        pythonCount = 5
        jSCount = 5
        puts ""

        totalString = "In total we sold: " + rubySold.to_s + " Ruby, " + javaSold.to_s + " Java, " + pythonSold.to_s + " Python, " + jSSold.to_s + " JavaScript."
        file.puts (totalString)
    end

    file.close()
end

file.close()