require "csv"
require "pry"	


#	priyaTrans = []
#	soniaTrans = []
#	trans = Hash.new	

 #   accountInfo = {Priya: {Allowance: [],CarRepairs: [], Rent: [], Entertainment: [], Fuel: [], Groceries: [], Meals: [], Clothes: [], Education: [], Donations: [], Utilities: [], Gifts: []}, Sonia: {Allowance: [], HouseholdGoods: [], Entertainment: [], Medical: [], Groceries: [], Clothes: [], Education: [], Gym: [], Utilities: [], Gifts: []}  }
	
	


#	entries = {account1: "Priya"{Transaction: 0, Category: category, totalSpent: runingBal},account2:"Sonia"{Transation: 0, Category: category, totalSpent: runingBal}}


@people ={}
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym] = {}

end
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym] = {total: 0, transactions: 0, avg: 0}
    

end
binding.pry
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    account = row["Account"].chomp.to_sym
    category = row["Category"].chomp.to_sym
    outflow = row["Outflow"].delete('$, , ').to_f
    inflow = row["Inflow"].delete('$, , ').to_f
    changeInFunds = inflow - outflow
    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym][total:]+= changeInFunds
    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym][transactions: += 1]
binding.pry

   
    avg = @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym]["total"] / transactions

    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym] = {total: total, transactions: 0, avg: 0}

end
  binding.pry





# @people ={}



# CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
#     if @people["Account"][] = nil 
#         @people[row["Account"]].chomp.to_sym = {}
# binding.pry

#     elsif @people["Account"]["Category"] = nil
#         @people[row["Account"]][row["Category"]] = {total: 0, transactions: 0, avg: 0}
 
    
#         outflow = row["Outflow"].delete('$, , ').to_f
#         inflow = row["Inflow"].delete('$, , ').to_f
#         changeInFunds = inflow - outflow
#         total = @people[row["Account"]][row["Category"]]["total"] + changeInFunds
#         transactions =  @people[row["Account"]][row["Category"]]["transactions"] + 1
#         avg = total / transactions
#         @people[row["Account"]][row["Category"]] = [total: total, transactions: transactions, avg: avg]
#     binding.pry
#     end
# end



















# CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    
#     accountName = row["Account"].chomp
#     category = row["Category"]
#     outflow = row["Outflow"]
#     inflow = row["Inflow"]
#     changeInFunds = inflow.delete('$, , ').to_f - outflow.delete('$, , ').to_f
   


#   	case accountName
#     when "Priya"
#         case category
#         when "Allowance"
#       #      accountInfo[Priya: Allowance:]<< changeInFunds

#    # puts accountInfo[Priya: Allowance:]
#     	binding.pry
#         end

    

#         priyaTrans.push(trans = {transCat: category, transAmmount: changeInFunds})
    	
# 	when "Sonia"
# 		soniaTrans.push(trans = {transCat: category, transAmmount: changeInFunds})
# 	end
	
# #h = {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 12 => 'dodecine'}  

# # puts soniaTransations[:transCatagory]
# # puts soniaTransations[:totalSpent]

# end





# @people ={}
# CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
#     @people[row["Account"].chomp.to_sym] = {}

# end
# CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
#     @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym] = []
# end

# CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
#     account = row["Account"].chomp.to_sym
#     category = row["Category"].chomp.to_sym
#     outflow = row["Outflow"]
#     inflow = row["Inflow"]
# end end
