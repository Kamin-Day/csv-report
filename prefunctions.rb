require "csv"
require "pry"
require_relative "./tests.rb"
require_relative "./functions.rb"

inputArgs = ARGV.map(&:upcase)
inputArgs = inputArgs.sort
binding.pry
#Not working - to return in different formats
#probably the wrong approach and needs to be deleted, 
# I was just playing with code when I made this top bit


# #-------------------------
# if ARGV == nil
# 	puts "Which account infortmation would you like to view?"
# 	puts "Please type in \"Sonia\", \"Priya\", or \"all\"."
# 	nameRequest = gets

# 	puts "Would you like the report for #{nameRequest} displayed?"
# 	puts "Please type in \"normal\", \"csv\", or \"html\"."
# 	displayFormat = gets

# end
# --------------

##===============================================================================
##===============================================================================
##===============================================================================




#THIS WILL EVENTUALLY BE CASE or IF ELSE STATEMENTS
#TO DETERMINE WHICH OUTPUT FUNCTION TO RUN, 

#################################################
# 	#  #####. #.   #. # # #
# 	#  # 	   #. #.  # # #
#####. #####     #.   # # #
# 	#. #        #.    
# 	#. #####   #.     # # #

# => Tomorrow, I need to start by creating some code
# =>  To print out the reports in HTML ALSO"
# =>   ..should be fun, try looking out guidelines for html output in ruby





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
	balanceSonia = getBalance("Sonia")
	balancePriya = getBalance("Priya")

	binding.pry
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




#EVERYTHING BELOW THIS IS BEING WORKED ON FOR THE EXTENSIONS
#AIM IS TO PRINT EITHER ALL OF THE RECORDS, OR JUST RECORDS
#FOR SONIA OR PRIYA BASED ON WHAT IS PASSED INTO THE ARGV VARIABLE
#WHEN THE FILE IS RAN FROM THE TERMINAL


#If no arguements passed, ARGV is an empty array [], and all accounts are printed


#printing is now finished, and boy is it ugly.
 	binding.pry

 

# THIS IS THE ELSIF STATEMENT	
#If passed "priya" as arguement, prints Priya's information
#Check ARGV using terminal while in pry to see its value
if ARGV[0].to_s.upcase == "PRIYA"
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
#FINISHED PRINTING PRIYA


#SAME CASE WITH ARGV - IF PASSED SONIA, WILL PRINT SONIAS INFORMATION
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

elsif ARGV[0] == nil

#ALL OF THE CODE FROM HERE TO THE ELSIF STATEMENT IS TO PRINT THE FULL REPORT

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

# #This is being worked on for the extensions, to return in CSV format
## ONLY WORKS PARTIALLY
# # #===============================================================================
if inputArgs.include?("CSV") and inputArgs.include?("SONIA")
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if row["Account"] = "Sonia"
			puts row
			
		end 
	end
elsif inputArgs.include? ("CSV" && "PRIYA")
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		if row["Account"] = "Priya"
			puts row
		end
	end
elsif inputArgs.include? ("CSV")
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		puts row
	end
end
# # =================================================================================

 
#EVENTUALLY, MAY WANT TO REORDER THE IF STATEMENTS TO BE
# if name
# => print name
# elsif other name
# => print other name
# elsif 
# => just print everything









