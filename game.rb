class Game

  @@current_player = ''

  def initialize

  end

  def generate_numbers
    numbers = []

    2.times do
      numbers << rand(1..20)
    end
    
    return numbers
  end

  def ask_question
    numbers = generate_numbers

    question = "What does #{numbers.first} plus #{numbers.last} equal?"

    puts question
  end

  def start_game
    puts "----- NEW GAME -----"
  end

  def end_game
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end