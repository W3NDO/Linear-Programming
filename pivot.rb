### Code to pivot linear equations ###
# Definitely needs a GUI soon
#A couple steps to be followed#.
=begin
 	1. Get the system of equations from the user
 		i) Dependent variables
 		ii) independent variables
 		iii) Coefficients

 	2. Get the pivot point. It is a coefficient

 	3. Do the pivot logic

 		 __		  __	     __			   ___
 		|	p 	r   |	    |	(1/p) 	      (r/p)   |
 		|	 	    | 	=>  |     		      |
 		|__	c	q __|       |__	(-c/p)    (q-(rc/p))__|

 	4. Return the pivoted result


=end

#W3NDO

#step 1: Get the System of equation sfrom the user
puts "Enter the number of dependant variables and the letter denoting it eg (3,s)"
x=gets
dependentVarCount = x.scan(/[0-9]+/).join().to_i
dependentVarSymbol =  x.scan(/[a-z A-Z]/).join()
puts "Enter the number of independent variables the letter denoting it eg (2,x)"
y = gets
independentVarCount = y.scan(/[0-9]+/).join().to_i
independentVarSymbol =  y.scan(/[a-z A-Z]/).join()
coefficientArr = []
independentVarSet = []
dependentVarSet =[]
for i in 1..independentVarCount
	independentVarSet << independentVarSymbol+i.to_s
end
for i in 1..dependentVarCount
	dependentVarSet << dependentVarSymbol+i.to_s
end
for i in 1..dependentVarCount
	puts "Enter the coefficients of equation #{i}. for instance, if the equation is 2x1+3x3 =s1, enter (2,3) without the brackets"
	coeffSet = gets.chomp.split(',')
	coefficientArr << coeffSet
end


puts "The Dependant variables are: #{dependentVarSet}"
puts "The Independant variables are: #{independentVarSet}"
puts "The Coefficients are: #{coefficientArr}}"
