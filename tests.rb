require "csv"
require "pry"
require_relative "./main.rb"
require_relative "./functions.rb"

def testsEquality(actual, expected)
	if actual != expected
		puts "Test Failed, \nexpected #{expected}"
		puts "\nGot: #{actual} "
	else
		puts "Test passed!"
	end
end
	
# testAccount = 
# {"Bob"=>
#   {"Allowance"=>[3500.00],
#    "Car Repairs"=>[-600.34],
#    "Rent"=>[-400.00],
#    "Entertainment"=>
#     [-20.62,
#      -35.00,
#      -15.0,
#      -14.54,
#      -3.75,
#      -1.25],
#    "Fuel"=>
#    [-33.92,
#    	38.95],
#    "Groceries"=>[-15.33, -205.87],
#   }
# }

# ## TESTS    getBalance()
def testGetBalance(account)
	expected = 2115.43
	actual = getBalance(testAccount["Bob"])
	if expected != actual 
		puts "Tested getsBalance()"
		puts "Test failed!!!"
		puts "\n\n Expected #{expected} \n\n Got #{actual}}"
	else
		puts "Tested getsBalance()"
		puts "Test Passed!!!!!!!!"
	end
end
# testGetBalance(testAccount)


# binding.pry

# #finds to totals for each catagory and puts them into an array	 
# def testGetCatagoryTotal(account)
# 	cataTotals = []
# 	@people[account].each_value {|catagoryTotal| cataTotals.push(catagoryTotal.sum.round(2))}
# 	return cataTotals
# end