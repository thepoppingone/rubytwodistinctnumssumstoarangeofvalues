  # require 'set'

  hashSet = Hash.new()
  for i in -10000..10000
  	hashSet[i] = Hash.new()
  end

  counter = 0

  check_dup_hash = Hash.new()

  t=0
  
  IO.foreach("cases/test2.txt") do |x|
  	n = x.to_i
  	if check_dup_hash[n].nil?
  		check_dup_hash[n] = n

  		hashSet.each do |i, a|
  			#puts "loop x:#{x}"+i.to_s
  			#puts "t: #{t}"
  			if hashSet[i][n].nil?
				#puts "not found"
				if i-n != n
					hashSet[i][(i-n)] = (i-n)
				end
			else
				hashSet.delete i
				counter = counter + 1
				#puts "found"
			end
		end

	else
		#puts "duplicate"
	end		
	puts t = t+1
	#puts "t: #{t}"
end

puts counter


# IO.foreach("cases/test1.txt") do |x|
# 	n = x.to_i
# 	if check_dup_hash[n].nil?
# 		check_dup_hash[n] = n
# 	else
# 		puts "duplicate"
# 	end		

# end