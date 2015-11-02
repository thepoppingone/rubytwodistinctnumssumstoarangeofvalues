  require 'set'
  iSet = Set.new()
  IO.foreach("cases/test1.txt") do |x|
    iSet.add x.to_i
  end

  def run_each(iSet)  
    while !iSet.empty?
    yield(iSet, true)
    iSet.delete(iSet.first)
    end
  end

  hSet = Set.new()

  oSet = iSet.clone()

  (oSet.length-1).times do 
    iSet = iSet.to_a.rotate.to_set
    hSet = hSet + oSet.zip(iSet).map {|a| a.inject(:+)}.to_set
  end

  hSet = hSet.select {|x| x >= -10000 and x<=10000}

  puts hSet.length