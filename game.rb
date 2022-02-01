class Game

  def initialize
    @players = []
    @player1 = ''
    @player2 = ''
    @current_player = ''
    @keep_playing = true
  end

  def add_player(player)
    @players << player
  end

  def play_game
    if @players.length == 2
      puts "----- NEW GAME -----"
      puts "Starting a new game!"
      
      @player1 = @current_player = @players.first
      @player2 = @players.last

      while @keep_playing do
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

  def ask_question
    puts "----- NEW TURN -----"

    name = @current_player.name
    
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

  def update_lives(wrong_answer = false)
    if wrong_answer
      @current_player.lives -= 1
    end

    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

    if @player1.lives <= 0 || @player2.lives <= 0
      @keep_playing = false
    end
  end

  def next_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def end_game
    puts "----- GAME OVER -----"
    
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    else
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    end

    puts "Good bye!"
  end

end