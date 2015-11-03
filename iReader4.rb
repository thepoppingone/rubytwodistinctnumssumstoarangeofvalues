  # This file uses the O(nlogn) time complexity of finding the number of 
  # distinct values of y 

  # Check for Time taken
  #beginning_time = Time.now

  # Read command line argument for the file name input and save it 
  # Reason: for easy testing with different files
  filename = ARGV[0]

  # Import the ruby `set` for removing duplicate values
  require 'set'

  # Declare a new set and add all the numbers read from the file to form a 
  # list of unique numbers
  numbers_set = Set.new()
  IO.foreach(filename) do |x|
    numbers_set.add x.to_i
  end

  # Declare and initialize a hash with all values of y as the `keys`, true as `values`
  # Reason: DELETION of the key will be O(1) time hence reduce runtime
  $hash_of_y = Hash.new()
  for i in -10000..10000
    $hash_of_y[i] = true;
  end

  # Sort the Set and it transforms into a sorted array
  # Reason: Positive numbers can be removed after 5000 as they fail condition after they are in order
  sorted_array = numbers_set.sort

  # Define the function that is to be run for each checking of the possible y
  # where `first` being the `a` of the equation
  # where `sorted_array[i]` and `sorted_array[j]` being the possible values of `b` of the equation
  def find_sum(first, sorted_array, i)
    
    # Declare and initialize the j before the while loop as the final index of the sorted_array
    j = sorted_array.size-1
    
    # A while loop to check from both the start of the array and from the end of the array
    while i<=j

      # Increments the index i until the lower limit of the range required is found
      if first+sorted_array[i] < -10000
        i+= 1
      # Decrements the index j until the upper limit of the range required is found  
      elsif first+sorted_array[j] > 10000
        j-= 1
      # From here on, all the values of a+b = y are values that fit into the condition
      # Carry out all deletion of the keys which are values of the valid y
      # Hash will return nil if key is not found
      else
        # Another while loop to purely just delete every key found
        # Reason: To skip the above two condition check that can cause additional run time
        while i<=j
          $hash_of_y.delete first+sorted_array[i]
          $hash_of_y.delete first+sorted_array[j] 
          i+=1
          j-=1
        end

      end

    end

  end

# Iterate through the array to find each different combination of a + b = y
sorted_array.each_with_index do |a, i|
  # For all values after 5000 it does not need to be checked
  # as it is sorted, all values after 5000 will fail the condition immediately
  break if a >= 5000
  # Run the search method taking note that the search must always start from
  # the next position after the first element
  find_sum(a,sorted_array,i+1)
end

# Maximum Number of y is 20001, hence just substract the hash length to find the distinct y found
# Reason: No need to waste memory space storing the `counter` variable to count
p 20001-$hash_of_y.length

# For testing the amount of time taken to run the program
#end_time = Time.now
#puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"