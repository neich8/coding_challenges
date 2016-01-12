module PrimeFactor

  def self.largest(num)
    guess = false
    i = num / 2
    while i > 1 || guess == false
      guess = i  if (num / i)== (num / i.to_f)
      i -= 1
      print "#{i},"
    end
    guess
  end

  def self.find_largest_quick(num)
    i = num / 2
    guess = false
    PrimeFactor::is_prime?(num, i)
    
    guess
  end

  def self.is_prime? num, i
    (num / i)== (num / i.to_f)
  end
end

PrimeFactor.find_largest_quick(600851475143)