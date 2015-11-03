  # This file uses the O(nlogn) time complexity of finding the number of 
  # distinct values of y 

  beginning_time = Time.now

  # Read command line argument for the file name input and save it 
  filename = ARGV[0]

  # Import the ruby `set` for removing duplicate values
  require 'set'

  # Declare a new set and add all the numbers read from the file to form a 
  # list of unique numbers
  numbers_set = Set.new()
  IO.foreach(filename) do |x|
    numbers_set.add x.to_i
  end

  # Declare and initialize a hash with all values of y as the `keys`
  $hash_of_y = Hash.new()
  for i in -10000..10000
    $hash_of_y[i] = true;
  end

  $counter = 0
  # Sort the Set and it transforms into a sorted array
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
      else

        if $hash_of_y.key?(first+sorted_array[i])
          #this outputs the unique one found
          p first+sorted_array[i]
          $hash_of_y.delete first+sorted_array[i]
          $counter += 1
        end

        if $hash_of_y.key?(first+sorted_array[j])
          #this outputs the unique one found
          p first+sorted_array[j]
          $hash_of_y.delete first+sorted_array[j] 
          $counter += 1
        end

        i+=1
        j-=1

      end

    end

  end

sorted_array.each_with_index do |f, i|
  break if f >= 5000
  find_sum(f,sorted_array,i)
end

p $counter
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"