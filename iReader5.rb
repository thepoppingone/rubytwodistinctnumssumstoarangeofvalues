  beginning_time = Time.now

  filename = ARGV[0]

  require 'set'
  iSet = Set.new()
  IO.foreach(filename) do |x|
      iSet.add x.to_i
    end

for f in iSet do

    (-10000..10000).each do |a|

    #a = -10000
    if iSet.include?(a-f) and f != (a-f)

      $hashSet.delete a

    end

  end

end

p 20001-$hashSet.length
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"