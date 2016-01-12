
module Fibonacci

  def self.evens(int)
    sum = 0
    preceeding_i = 1
    i = 1
    until int < i
      if i % 2 == 0
        sum += i
      end
      temp_i = i
      i += preceeding_i
      preceeding_i = temp_i
    end
    sum
  end

end

puts Fibonacci.evens(4000000)