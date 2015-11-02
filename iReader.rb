  beginning_time = Time.now

  require 'set'
  iSet = Set.new()
  IO.foreach("cases/test2.txt") do |x|
    iSet.add x.to_i
  end

  def run_each(iSet)  
    while !iSet.empty?
    yield(iSet, true)
    iSet.delete(iSet.first)
    end
  end

  fSet = Set.new()

  run_each(iSet) do |fresh_set, check|
    e = fresh_set.each
    a = e.next
    while check
      begin
        b = e.next  
        y = a+b
        fSet.add(y) if y.between?(-10000,10000)  
      rescue StopIteration
        check = false
      end
       end
  end

  puts fSet.length

  end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

  #hSet1 = iSet.zip(iSet2).map {|a| a.inject(:+)}.to_set
  #b = a.select { |x| x % 2 == 0 }