print "Input a year: "
number = gets().to_i
leapyear = false

if (number%4 == 0)
    leapyear = true
    if (number % 100 == 0)
        if (number % 400 == 0)
            leapyear = true
        else
            leapyear = false
        end
    else
        leapyear = true
    end
end 

if leapyear == true
    puts "This year was a leap year."
else
    puts "This year was not a leap year."
end