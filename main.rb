require "csv"
require "pry"	



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

  	  #here is where we want to put the things, .push is what we are putting the things in 



end
	balanceSonia = 0
	balancePriya = 0

#This line groes through each value for "Sonia", which are the categories.
#For each catagory, it takes the sum its value, the array of transactions, and
#adds them to the variable "balanceSonia"
  	@people["Sonia"].each_value {|transVal| balanceSonia += transVal.sum.round(2)}


#This line groes through each value for "Sonia", which are the categories.
#For each catagory, it takes the sum its value, the array of transactions, and
#adds them to the variable "Priya"

  	@people["Priya"].each_value {|transVal| balancePriya += transVal.sum.round(2)}

	puts balancePriya.round(2)
	puts balanceSonia.round(2)
	 

 	binding.pry

 	puts "...."













