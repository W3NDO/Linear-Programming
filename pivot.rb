### Code to pivot linear equations ###
# Definitely needs a GUI soon
#Hope this works.
#W3NDO

def pivot()
	puts "Enter the number of dependent variables"
	dependentVarCount = gets.to_i
	puts "Enter the number of independent variables"
	independentVarCount = gets.to_i
	equationSet = []
	dependentVarSet = []
	if dependentVarCount == 1
		puts "Enter the coefficients of the first equation. Note that the variables with a coefficient of 0 must be entered as 0"
		temp = gets.chomp
		equationSet << temp.scan(/-?\w+/)[0..temp.scan(/\w+/).length-2] #regex to get the independent variables
		dependentVarSet << temp.scan(/-?\w+/).last #regex to get the dependent variable
	else
		for i in 1..dependentVarCount
			puts "Enter the coefficients of equation #{i}. Note that variables with a coefficient of 0 must be entered as 0"
			temp = gets.chomp
			equationSet << temp.scan(/-?\d+/)[0..temp.scan(/\d+/).length-2]
			#dependentVarSet << temp.scan(/-?\d+/).last
		end
	end
	puts "#{dependentVarSet}"
	puts "#{equationSet}"

end
pivot()
