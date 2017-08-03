require "csv"
require "pry"	


	priyaTrans = []
	soniaTrans = []
	trans = Hash.new	

    accountInfo = {Priya: {Allowance: [],CarRepairs: [], Rent: [], Entertainment: [], Fuel: [], Groceries: [], Meals: [], Clothes: [], Education: [], Donations: [], Utilities: [], Gifts: []}, Sonia: {Allowance: [], HouseholdGoods: [], Entertainment: [], Medical: [], Groceries: [], Clothes: [], Education: [], Gym: [], Utilities: [], Gifts: []}  }
	
	


#	entries = {account1: "Priya"{Transaction: 0, Category: category, totalSpent: runingBal},account2:"Sonia"{Transation: 0, Category: category, totalSpent: runingBal}}


@people ={}
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym] = {}

end
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym] = []
end

CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    account = row["Account"].chomp.to_sym
    category = row["Category"].chomp.to_sym
    outflow = row["Outflow"]
    inflow = row["Inflow"]
binding.pry


CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    
    accountName = row["Account"].chomp
    category = row["Category"]
    outflow = row["Outflow"]
    inflow = row["Inflow"]
    changeInFunds = inflow.delete('$, , ').to_f - outflow.delete('$, , ').to_f
    Pri


  	case accountName
    when "Priya"
        case category
        when "Allowance"
      #      accountInfo[Priya: Allowance:]<< changeInFunds

   # puts accountInfo[Priya: Allowance:]
    	binding.pry
        end

    

        priyaTrans.push(trans = {transCat: category, transAmmount: changeInFunds})
    	
	when "Sonia"
		soniaTrans.push(trans = {transCat: category, transAmmount: changeInFunds})
	end
	
#h = {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 12 => 'dodecine'}  

# puts soniaTransations[:transCatagory]
# puts soniaTransations[:totalSpent]

end





@people ={}
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym] = {}

end
CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    @people[row["Account"].chomp.to_sym][row["Category"].chomp.to_sym] = []
end

CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
    account = row["Account"].chomp.to_sym
    category = row["Category"].chomp.to_sym
    outflow = row["Outflow"]
    inflow = row["Inflow"]
end end
