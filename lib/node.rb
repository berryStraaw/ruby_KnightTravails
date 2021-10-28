class Node 
    attr_accessor :pos
    attr_accessor :paths

    def initialize(pos=[],paths=[])
        @pos=pos
        @paths=paths
    end
end