class Board 
    attr_accessor :board
    def initialize()
        arr=[]
        8.times do |row|
            arr<<[]
            8.times do |col|
                arr[row]<<""

            end
        end
        @board=arr
    end

    def display()
        8.times do |row|
            p @board[row]
        end
    end

    def add(thing)
        pos=thing.root.pos
        @board[pos[0]][pos[1]]=thing.value
    end
end