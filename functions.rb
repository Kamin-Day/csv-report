require "csv"
require "pry"
require_relative "./main.rb"
require_relative "./tests.rb"


#This line groes through each value for "Account", which are the categories.
#For each catagory, it takes the sum its value, the array of transactions, and
#adds them to the variable "bal" and returns the balance

#Creates array of inputs arguements for output
def handleInput(inputs)
		inputArgs = ARGV.map(&:upcase)
		inputArgs = inputArgs.sort
	return inputArgs
end

#calculates the balance
def getBalance(account)
		bal = 0
	  	@people[account].each_value {|transVal| bal += transVal.sum.round(2)}
	return bal.round(2)
end

#finds to totals for each catagory and puts them into an array	 
def getCatagoryTotal(account)
	cataTotals = []
	@people[account].each_value {|catagoryTotal| cataTotals.push(catagoryTotal.sum.round(2))}
	return cataTotals
end

#finds the averages for each catagory and puts them in an array
def getAverages(account)
	cataAvg = []
	@people[account].each_value {|catagoryTotal| cataAvg.push((catagoryTotal.sum.round(2) / catagoryTotal.length).round(2))}
	return cataAvg
end



def selectOutput(inputArgs)
	if inputArgs.include?("CSV") and inputArgs.include?("SONIA")
		printSoniaCSV
	elsif inputArgs.include? ("CSV") and inputArgs.include?("PRIYA")
		printPriyaCSV
	elsif inputArgs.include? ("CSV")
		printCSV
	elsif inputArgs.include? "PRIYA"
		printPriya
	elsif inputArgs.include? "SONIA"
		printSonia
	else
		printAll
	end
end

def printAll
	i = 0
	puts @lineBreak
	puts "Account: Priya... Balance: $#{getBalance("Priya").round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
#this loop outputs information from the arrays in a line, and increases 
#  	the index to continue. line is formated with the .ljust method
	while i < @accountsPriya.length
  		puts "#{@accountsPriya[i].to_s.ljust(18)} | $#{@cataTotalsPriya[i].to_s.ljust(10)} | $#{@cataAvgsPriya[i].to_s}"
		i += 1
	end	
#resets the index back to 0 to use for next account
	i = 0
#First account has now been printed
#prints account header with name and balance
# 	also prints colum (haha i cant spell, hurray!) titles
	puts	
	puts @lineBreak
	puts "Account: Sonia... Balance: $#{getBalance("Sonia").round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
	while i < @accountsSonia.length
  		puts "#{@accountsSonia[i].to_s.ljust(18)} | $#{@cataTotalsSonia[i].to_s.ljust(10)} | $#{@cataAvgsSonia[i].to_s}"
		i += 1
	end	
	puts
	i = 0
end

def printSonia()
	i = 0
	puts	
	puts @lineBreak
	puts "Account: Sonia... Balance: $#{getBalance("Sonia").round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
	while i < @accountsSonia.length
  		puts "#{@accountsSonia[i].to_s.ljust(18)} | $#{@cataTotalsSonia[i].to_s.ljust(10)} | $#{@cataAvgsSonia[i].to_s}"
		i += 1
	end	
	puts
	i = 0
end
def printPriya
	i = 0
	puts @lineBreak
	puts "Account: Priya... Balance: $#{getBalance("Priya").round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide

#this loop outputs information from the arrays in a line, and increases 
#  	the index to continue. line is formated with the .ljust method
	while i < @accountsPriya.length
  		puts "#{@accountsPriya[i].to_s.ljust(18)} | $#{@cataTotalsPriya[i].to_s.ljust(10)} | $#{@cataAvgsPriya[i].to_s}"
		i += 1
	end	
#resets the index back to 0 to use for next account
	i = 0
end
def printCSV
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		puts row
	end
end
def printSoniaCSV
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if row["Account"] = "Sonia"
			puts row
			
		end 
	end
end
def printPriyaCSV
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if row["Account"] = "Priya"
			puts row
		end
	end
end


