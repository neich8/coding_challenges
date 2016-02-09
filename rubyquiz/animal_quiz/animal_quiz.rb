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

  def query to_add
    @query = @query[to_add]
  end

end





animal_quiz = Quiz.new
animal_quiz.start