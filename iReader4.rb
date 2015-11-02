  beginning_time = Time.now

  require 'set'
  iSet = Set.new()
  IO.foreach("cases/medium.txt") do |x|
    iSet.add x.to_i
  end

  $hashSet = Hash.new()
  for i in -10000..10000
    $hashSet[i] = Hash.new()
  end

  sortedList = iSet.sort

  i,j = 1, sortedList.size-1
  $counter = 0;

def find_sum(first, sortedList, i, j)

  while i<=j
   if first+sortedList[i] < -10000
    i+= 1
   elsif first+sortedList[j] > 10000
    j-= 1
   else

    if !$hashSet[first+sortedList[i]].nil?
      #this outputs the unique one found
      #p first+sortedList[i]
      $hashSet.delete first+sortedList[i]
      $counter += 1
    end

    if !$hashSet[first+sortedList[j]].nil?
      #this outputs the unique one found
      #p first+sortedList[j]
      $hashSet.delete first+sortedList[j] 
      $counter += 1
    end

    i+=1
    j-=1
    #end of else
   end

 end

end

for f in sortedList do
  # This starts the next index
  p "the next f is #{f}"
  #next if f < -5000
  break if f >= 5000
  find_sum(f,sortedList,i,j)
  i+= 1
  #p "next"
end

p $counter
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"