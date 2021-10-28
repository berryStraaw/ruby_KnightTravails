require_relative 'knight'
require_relative 'board'

board=Board.new()
knight=Knight.new([3,3])
board.add(knight)
#board.display()

#p knight.root

#p knight.find_node([4,4])
#p board.kind_of?Board
#knight.find_node([1,6]) #8,6
#p knight.root
#p knight.find_node_child([0,4])
#p knight.find_node_child([0,4])
destination=[4,3]
path= knight.path(destination)
puts "You made it in #{path.length} turns! Here's your path:"
path.each do|path|
    p path
end
p destination


puts "done"