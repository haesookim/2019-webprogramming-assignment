baseArray = Array[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
randArray = Array.new

for i in 0..3
    arr= baseArray[rand(10-i)]
    baseArray.delete(arr)
    randArray.push(arr)
end

file = File.new("leaderboard.txt", "a+")
numtries = 0

while (true)
    numtries = numtries + 1
    printString =""

    print "Type 4 numbers: "
    num = gets.chomp()

    userArray = num.split("")

    if randArray.join == num
        break
    end

    for i in 0..3
        if randArray[i] == userArray[i].to_i
            printString<< randArray[i].to_s+"S "
            userArray[i] = "swap"
        end

        for j in 0..3
            if randArray[i] == userArray[j].to_i
                printString << randArray[i].to_s+"B "
                userArray[j] = "swap"
            end
        end
        
    end

    puts printString
    puts numtries
end

print "Congratulations! You have gotten the answer! \nPlease type your name for the leaderboard: "
name = gets.chomp()
timeVar = Time.now
recordArray = Array[name, numtries, timeVar]
file.puts "["+recordArray.join("/")+"]"

file.close()