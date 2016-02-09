# Todo build new json as user goes through tree.

require 'byebug'

require 'json'
require 'ostruct'
require 'debugger'
require "./phrases.rb"


class Quiz
  include Phrases

  attr_accessor :query
  def initialize
    file = File.read("animal-questions.json")
    @answers = JSON.parse(file)
    @query = @answers
    start
  end

  def start
    puts @questions.keys.first
    query @questions.keys.first
    parse_answer
  end

  def parse_answer
    while @query.is_a? Hash
      to_add = gets.chomp
      query to_add
      if @query.is_a? String
        right_answer
      else
        next_question
        query @query.keys.first
      end
    end
  end

  def right_answer
    guess
    answer = gets.chomp
    if answer == "yes"
      celebrate
    else
      give_up
      new_animal = get_question_for(gets.chomp)
      new_question = gets.chomp
    end
  end

  def add_to_json(new_animal, new_question)
    i = 0
    question = false
    while i < @step_directions.length
      st = @step_directions[i]
      if i == (@step_directions.length - 1)
        new_stuff = {"#{new_question}" => {"yes" =>new_animal, "no" => "elephant"} }
        set_question(st, new_stuff)
      end
      i += 1
    end
    debugger
    puts ""
  end

  def set_question(st, new_stuff)
      if question
        question[st] = new_stuff
      else 
        @questions[st] = new_stuff
      end
  end

  def query to_add
    @query = @query[to_add]
  end

end





animal_quiz = Quiz.new
