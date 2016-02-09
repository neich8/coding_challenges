module Phrases
  def guess
    puts "is it a #{@query}?"
  end

  def celebrate
    puts "Woot Woot!"
  end

  def give_up
    puts "What animal was it?"
  end

  def get_question_for(new_animal)
    puts "What is a question that can diferentiate a #{new_animal} from a #{@query}?"
  end

  def next_question
    puts @query.keys.first
  end

end