require_relative 'knight'
require_relative 'board'

board=Board.new()
knight=Knight.new([4,4])
board.add(knight)
board.display()

p knight.root