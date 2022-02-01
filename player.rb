require './game'

class Player < Game

  def initialize(name)
    @name = name
    @lives = 3
  end

  attr_accessor :lives, :name

end