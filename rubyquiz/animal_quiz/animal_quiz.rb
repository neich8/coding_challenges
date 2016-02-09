require 'json'

class Quiz

  def initialize
    @answers = read_json
    @directions = []
    @query = @answers
  end

  def start
    while @query.is_a? Hash
      query(ask_question)
      answer = gets.chomp
      query(answer)
      if @query.is_a? String
        check_answer
      end
    end
  end

  def check_answer
    puts "is it a #{@query}?"
    if gets.chomp == "yes"
      puts "Woot Woot!"
    else
      puts "What animal was it?"
      new_animal = gets.chomp
      puts "What is a question that can diferentiate a #{new_animal} from a #{@query}?"
      new_question = gets.chomp
      add(new_animal, new_question)
    end
  end

  def add(new_animal, new_question)
    new_map = {new_question => {"yes" => new_animal, "no"=> @query} }
    eval("@answers['#{@directions.join("']['")}']=#{new_map}")
    
    write_json
  end

  def ask_question
    p @query.keys.first
  end

  def write_json
    File.open("animal-questions.json", 'w') do |f|
      f.write(@answers.to_json)
    end
  end

  def read_json
    file = File.read("animal-questions.json")
    JSON.parse(file)
  end

  def query(answer=nil)
    @query = @query[answer]
    @directions << answer
  end

end


quiz = Quiz.new
quiz.start
