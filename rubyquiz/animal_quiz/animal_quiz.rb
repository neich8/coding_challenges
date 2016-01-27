require 'byebug'
require 'json'

class AnimalQuiz

  attr_accessor :query
  def initialize
    file = File.read("animal-questions.json")
    @answers = JSON.parse(file)
    @query = @answers
    @step_directions = []
  end

  def start
    puts @answers.keys.first
    query @answers.keys.first
    parse_answer
  end

  def parse_answer
    while @query.is_a? Hash
      to_add = gets.chomp
      query to_add
      if @query.is_a? String
        right_answer
      else
        p @query.keys.first
        query @query.keys.first
      end
    end
  end

  def right_answer
    puts "is it a #{@query}?"
    answer = gets.chomp
    if answer == "yes"
      puts "Woot Woot!"
    else
      puts "What animal was it?"
      new_animal = gets.chomp
      print "What is a question that can diferentiate a #{new_animal} from
      a #{@query}? \n"
      new_question = gets.chomp
      add_to_json(new_animal, new_question)
    end
  end

  def add_to_json(new_animal, new_question)
    
    debugger
    p "ha"
  end

  def query to_add
    @step_directions << to_add
    @query = @query[to_add]
  end

end





animal_quiz = AnimalQuiz.new
animal_quiz.start