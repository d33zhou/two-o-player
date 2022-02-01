class Game

  def initialize
    @@players = []
    @@current_player = ''
    @@keep_playing = true
  end

  def ask_question
    puts "----- NEW TURN -----"

    name = @@current_player.name
    
    numbers = generate_numbers
    question = "What does #{numbers.first} plus #{numbers.last} equal?"

    puts "#{name}: #{question}"

    answer = gets.chomp
    
    if numbers.first + numbers.last == answer.to_i
      puts "#{name}: YES! You are correct."
      update_lives
    else
      puts "#{name}: Seriously? No!"
      update_lives(true)
    end

    next_player
  end
  
  def add_player(player)
    @@players << player
  end

  def next_player
    if @@current_player == @@players.first
      @@current_player = @@players.last
    else
      @@current_player = @@players.first
    end
  end


  def update_lives(wrong_answer = false)
    if wrong_answer
      @@current_player.lives -= 1
    end

    puts "P1: #{@@players.first.lives}/3 vs P2: #{@@players.last.lives}/3"

    if @@players.first.lives <= 0 || @@players.last.lives <= 0
      @@keep_playing = false
    end
  end

  def play_game
    if @@players.length == 2
      puts "----- NEW GAME -----"
      puts "Starting a new game!"
      
      @@current_player = @@players.first

      while @@keep_playing do
        ask_question
      end

      end_game

    else
      puts "This game only supports 2 players!"
    end
  end

  def generate_numbers
    numbers = []

    2.times do
      numbers << rand(1..20)
    end
    
    return numbers
  end

  def end_game
    puts "----- GAME OVER -----"
    
    if @@players.first.lives == 0
      puts "#{@@players.last.name} wins with a score of #{@@players.last.lives}/3"
    else
      puts "#{@@players.first.name} wins with a score of #{@@players.first.lives}/3"
    end

    puts "Good bye!"
  end

end