require './game'

class Player < Game

  def initialize
    @lives = 3
  end

  attr_accessor :lives

end