class Game

  @@current_player = 'Player 1'

  def initialize

  end

  def generate_numbers
    numbers = []

    2.times do
      numbers << rand(1..20)
    end
    
    return numbers
  end

  def generate_question
    numbers = generate_numbers

    question = "What does #{numbers.first} plus #{numbers.last} equal?"

    return question
  end

  def ask_question
    numbers = generate_numbers
    question = "What does #{numbers.first} plus #{numbers.last} equal?"
    
    puts "#{@@current_player}: #{question}"

    answer = gets.chomp
    
    if numbers.first + numbers.last == answer.to_i
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
    end

  end

  def start_game
    puts "----- NEW GAME -----"
  end

  def end_game
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end