require './game'
require './player'

game = Game.new
player1 = Player.new('Player 1')
player2 = Player.new('Player 2')
game.add_player(player1)
game.add_player(player2)

game.play_game