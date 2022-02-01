require './game'
require './player'

game = Game.new
player1 = Player.new('Joe')
player2 = Player.new('Bob')
game.add_player(player1)
game.add_player(player2)

game.play_game