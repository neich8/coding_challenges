# Todo build new json as user goes through tree.

require 'json'

class Quiz


  attr_accessor :query
  def initialize
    file = File.read("animal-questions.json")
    @answers = JSON.parse(file)
    @query = @answers
    @directions = []

  end

  def start
    puts @answers.keys.first
    query(@answers.keys.first)
    parse_answer
  end

  def parse_answer
    while @query.is_a? Hash
      answer = gets.chomp
      query(answer)
      if @query.is_a? String
        right_answer
      else
        puts @query.keys.first
        @directions << @query.keys.first
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
      puts "What is a question that can diferentiate a #{new_animal} from a #{@query}?"
      new_question = gets.chomp
      add(new_animal, new_question, @query)
    end
  end

  def add(new_animal, new_question, wrong_animal)
    a = {new_question => {"yes" => new_animal, "no"=> wrong_animal} }
    eval("@answers['#{@directions.join("']['")}']=#{a}")
    
    write_json
  end

  def write_json
    File.open("animal-questions.json", 'w') do |f|
      f.write(@answers.to_json)
    end
  end

  def query answer
    @query = @query[answer]
    @directions << answer
  end

end





quiz = Quiz.new
quiz.start
