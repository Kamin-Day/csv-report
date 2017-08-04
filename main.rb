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

    runningTotal =@people[row["Account"].chomp][row ["Category"].chomp]

    #You are runnning the [ ] method on something that is nil

end
 binding.pry

"."











