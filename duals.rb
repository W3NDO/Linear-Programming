def getDual()
  constraint =[]
  coefficient_matrix = []
  puts "Is the problem a standard maximum or a standard minimum. (Enter max or min respectively)"
  problem_type = gets.chomp
  puts "How many unknowns are there?"
  unknowns = gets.chomp.to_i
  puts "Enter the coefficients of the objective function delimited by a comma. eg 2,5,6"
  obj_Func_Coefficients = gets
  objective_function = obj_Func_Coefficients.split(',')
  puts "How many constraints are there?"
  num = gets
  num = num.to_i

  for i in 1..num
    puts "Enter the coefficients of constraint #{i} and its inequality, all  separated by commas eg: 1,2,3 => 1x_1 + 2x_2 <= 3 \n"
    set = gets
    set = set.split(',')
    if set.length() < unknowns+1
      puts "Please enter the correct number of constraint co-efficients"
    end
    set = set.map(&:to_i)
    coefficient_matrix << set[0..unknowns-1]
    constraint << set[unknowns]
  end
  #up to this point the code will take in the coefficients of the objective function and the constraints.

  dual_Objective_Function = []
  dual_Constraint_Set = []
  finalDualConstraints = []
  if problem_type.downcase() == "max"
    #formats the output of the dual's objective function
    for i in 0..constraint.length-1
      dual_Objective_Function << constraint[i].to_s + "(y" + (constraint.index(constraint[i])+1).to_s + ")"
    end

    #formats the output of the dual's constraints into a multi-dimensional array
    for i in 0..unknowns-1
      tempConstraintArr = []
      for j in 0..coefficient_matrix.length-1
        tempConstraintArr  << coefficient_matrix[j][i]
      end
      dual_Constraint_Set << tempConstraintArr
    end

    puts "The Dual of the problem is minimize #{dual_Objective_Function.join("+")} subject to the constraints: \n"
    for i in 0..dual_Constraint_Set.length-1
      temp = []
      x = dual_Constraint_Set[i]
      for j in 0..x.length-1
        temp << x[j].to_s + "(y" + (x.index(x[j])+1).to_s + ")"
      end
      puts "\t #{temp.join("+")} >= #{objective_function[i]}"	
    end
  elsif	problem_type.downcase() == 'min'
    for i in 0..constraint.length-1
      dual_Objective_Function << constraint[i].to_s + "(x" + (constraint.index(constraint[i])+1).to_s + ")"
    end

    #formats the output of the dual's constraints into a multi-dimensional array
    for i in 0..unknowns-1
      tempConstraintArr = []
      for j in 0..coefficient_matrix.length-1
        tempConstraintArr  << coefficient_matrix[j][i]
      end
      dual_Constraint_Set << tempConstraintArr
    end

    puts "The Dual of the problem is maximize #{dual_Objective_Function.join("+")} subject to the constraints: \n"
    for i in 0..dual_Constraint_Set.length-1
      count = 0
      temp = []
      x = dual_Constraint_Set[i]
      for j in 0..x.length-1
        temp << x[j].to_s + "(x" + (count+1).to_s + ")"
      end
      puts "\t #{temp.join("+")} <= #{objective_function[i]}"	
    end
  end
end
getDual()