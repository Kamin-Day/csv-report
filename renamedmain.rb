require "csv"
require "pry"

# if ARGV == nil
# 	puts "Which account infortmation would you like to view?"
# 	puts "Please type in \"Sonia\", \"Priya\", or \"all\"."
# 	nameRequest = gets

# 	puts "Would you like the report for #{nameRequest} displayed?"
# 	puts "Please type in \"normal\", \"csv\", or \"html\"."
# 	displayFormat = gets
# end


@people ={}
#This adds keys for both Priya and Sonia to @people
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp] = {}
end
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp][row["Category"].chomp] = []
end
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    account = row["Account"].chomp
    category = row["Category"].chomp
    outflow = row["Outflow"].delete('$, , ').to_f
    inflow = row["Inflow"].delete('$, , ').to_f
    changeInFunds = inflow - outflow 
	
	@people[row["Account"].chomp][row ["Category"].chomp].push(changeInFunds)
end
#holds account balances
	balanceSonia = 0
	balancePriya = 0
#holds catagory totals in array
	cataTotalsSonia = []
	cataTotalsPriya = []
#holds transaction averages in array
	cataAvgsSonia = []
	cataAvgsPriya = []
#creates an array of account titles
	accountsPriya = @people["Priya"].keys
	accountsSonia = @people["Sonia"].keys
#index used for printing
	i = 0
#line breaks used in printing
	@lineBreak = "======================================================"
	@lineDivide = "------------------ | ----------- | -------------------"

#This line groes through each value for "Sonia", which are the categories.
#For each catagory, it takes the sum its value, the array of transactions, and
#adds them to the variable "balanceSonia"
  	@people["Sonia"].each_value {|transVal| balanceSonia += transVal.sum.round(2)}


#This line groes through each value for "Sonia", which are the categories.
#For each catagory, it takes the sum its value, the array of transactions, and
#adds them to the variable "Priya"

  	@people["Priya"].each_value {|transVal| balancePriya += transVal.sum.round(2)}

#finds to totals for each catagory and puts them into an array	 
	@people["Priya"].each_value {|catagoryTotal| cataTotalsPriya.push(catagoryTotal.sum.round(2))}
	@people["Sonia"].each_value {|catagoryTotal| cataTotalsSonia.push(catagoryTotal.sum.round(2))}

#finds the averages for each catagory and puts them in an array

	@people["Sonia"].each_value {|catagoryTotal| cataAvgsSonia.push((catagoryTotal.sum.round(2) / catagoryTotal.length).round(2))}
	@people["Priya"].each_value {|catagoryTotal| cataAvgsPriya.push((catagoryTotal.sum.round(2) / catagoryTotal.length).round(2))}






binding.pry

if ARGV == nil

puts @lineBreak
	puts "Account: Priya... Balance: $#{balancePriya.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide

#this loop outputs information from the arrays in a line, and increases 
#  	the index to continue. line is formated with the .ljust method
	while i < accountsPriya.length
  		puts "#{accountsPriya[i].to_s.ljust(18)} | $#{cataTotalsPriya[i].to_s.ljust(10)} | $#{cataAvgsPriya[i].to_s}"
		i += 1
	end	
#resets the index back to 0 to use for next account
	i = 0

#First account has now been printed


#prints account header with name and balance
# 	also prints colum (haha i cant spell, hurray!) titles
	
	puts	
	puts @lineBreak
	puts "Account: Sonia... Balance: $#{balanceSonia.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
	while i < accountsSonia.length
  		puts "#{accountsSonia[i].to_s.ljust(18)} | $#{cataTotalsSonia[i].to_s.ljust(10)} | $#{cataAvgsSonia[i].to_s}"
		i += 1
	end	
	puts
	i = 0

#printing is now finished, and boy is it ugly.

 	puts "...."

if ARGV.include? "CSV" && "Sonia"
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if "Account" == "Sonia"
			puts row 
		end 
	end
elsif ARGV.include? "CSV" && "Priya"
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if "Account" == "Priya"
			puts row 
		end
	end
elsif ARGV.include? "CSV"
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		puts row 
	end
end









 	
#this is where printing starts

#prints account header with name and balance
# 	also prints colum (haha i cant spell, hurray!) titles
	
#If no arguements passed, ARGV is nil and all accounts are printed
if ARGV[0] == nil
	puts @lineBreak
	puts "Account: Priya... Balance: $#{balancePriya.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide

#this loop outputs information from the arrays in a line, and increases 
#  	the index to continue. line is formated with the .ljust method
	while i < accountsPriya.length
  		puts "#{accountsPriya[i].to_s.ljust(18)} | $#{cataTotalsPriya[i].to_s.ljust(10)} | $#{cataAvgsPriya[i].to_s}"
		i += 1
	end	
#resets the index back to 0 to use for next account
	i = 0

#First account has now been printed


#prints account header with name and balance
# 	also prints colum (haha i cant spell, hurray!) titles
	
	puts	
	puts @lineBreak
	puts "Account: Sonia... Balance: $#{balanceSonia.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
	while i < accountsSonia.length
  		puts "#{accountsSonia[i].to_s.ljust(18)} | $#{cataTotalsSonia[i].to_s.ljust(10)} | $#{cataAvgsSonia[i].to_s}"
		i += 1
	end	
	puts
	i = 0
end
#printing is now finished, and boy is it ugly.
 	binding.pry

 	puts "...."
#If passed "priya" as arguement, prints Priya's information
elsif ARGV[0].to_s.upcase == "PRIYA"
	puts @lineBreak
	puts "Account: Priya... Balance: $#{balancePriya.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide

#this loop outputs information from the arrays in a line, and increases 
#  	the index to continue. line is formated with the .ljust method
	while i < accountsPriya.length
  		puts "#{accountsPriya[i].to_s.ljust(18)} | $#{cataTotalsPriya[i].to_s.ljust(10)} | $#{cataAvgsPriya[i].to_s}"
		i += 1
	end	
#resets the index back to 0 to use for next account
	i = 0

#If passed "sonia" as arguement, prints Sonia's information
elsif ARGV[0].to_s.upcase == "SONIA"
	puts	
	puts @lineBreak
	puts "Account: Sonia... Balance: $#{balanceSonia.round(2)}"
	puts @lineBreak
	puts "Catagory           | Total Spent | Average Transaction"
	puts @lineDivide
	while i < accountsSonia.length
  		puts "#{accountsSonia[i].to_s.ljust(18)} | $#{cataTotalsSonia[i].to_s.ljust(10)} | $#{cataAvgsSonia[i].to_s}"
		i += 1
	end	
	puts

	binding.pry

 	puts "...."
end
