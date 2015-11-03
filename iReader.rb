  # This file uses the n factorial way (brute force method) and it only manages to
  # pass the first two test files: test1.txt test2.txt
  # beginning_time = Time.now

  # import the ruby `set` for removing duplicate values
  require 'set'

  # Declare a new set and add all the numbers read from the file to form a 
  # list of unique numbers
  iSet = Set.new()
  IO.foreach("cases/test2.txt") do |x|
    iSet.add x.to_i
  end

  # Defined a function that iterates through the Set until the Set is completely empty
  def run_each(iSet)  
    while !iSet.empty?
      yield(iSet, true)
      iSet.delete(iSet.first)
    end
  end

  # Declare a new set to store all the unique values of y found
  fSet = Set.new()

  # Run the method, inserting a block of a constantly updated Set
  run_each(iSet) do |fresh_set, check|
    # Declare an Enumerator from the set 
    e = fresh_set.each
    # Enumerate the set and save the first element to variable `a`
    a = e.next
    # Run a loop for it to check the sum of the first element and the following elements whether they 
    # satisfiy the condition -10000 < y < 10000
    while check
      begin
        b = e.next   
        y = a+b
    # Add the found y into the Set
        fSet.add(y) if y.between?(-10000,10000)  
      rescue StopIteration
        check = false
      end
    end
  end

  # Output the final set's length as the number of y found
  puts fSet.length

  #end_time = Time.now
  #puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
