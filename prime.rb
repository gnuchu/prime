class Fixnum
  #monkey patch Fixnum to do the heavy lifting. Check if self is a multiple of supplied number.
  def is_multiple_of_x(x)
    ((self % x) == 0) && (self != x) ? true : false
  end
end

dict = {} 
n = 1000000 #top limit - the higher this is, the hotter your computer will get. 

n.times do |i|
  dict[i+2] = nil #start from 2 as we're ignoring 0 and 1.
end

# dict.each_key { |key| key.even? ? dict[key] = false : nil }

[2,3,5,7,9].each do |y| #no need to do more processing than required. Only need to check for multiples of 2 with even numbers.
  dict.each do |k, v|
    k.is_multiple_of_x(y) ? dict[k] = false : nil
  end
end

dict.each do |k,v|
  v.nil? ? dict[k] = true : nil
end

primes = dict.select { |k,v| v == true }

File.open("primes.txt", "w") { |file|
  primes.each do |p|
    file.puts p[0]
  end
}