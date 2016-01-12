
class Multiples

  def self.sum(int)
    arry = (3...int).to_a
    multis = arry.map do |num|
      if num % 3 == 0 || num % 5 == 0
        num
      end
    end
    multis.compact.inject(:+)
  end
end


puts Multiples.sum(1000)