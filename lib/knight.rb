require_relative 'node'

class Knight
    attr_accessor :value
    attr_accessor :root

    def initialize(pos=[0,0], value="K")
        @value=value
        @root=build_tree(pos)
    end

    def build_tree(pos, taken=[])
        return nil if pos[0]>8 || pos[0]<0 || pos[1]>8 || pos[1]<0    
        node=Node.new(pos)
        taken<<node.pos
        node.paths=newPositions(pos,node)
        node.paths.map! do |path|
            unless taken.include?(path)
                build_tree(path,taken)
            end
        end
        return node
    end
    
    def newPositions(pos,node)
        newPositions=[]
        pos1=node.pos[0]+2,node.pos[1]+1
        pos2=node.pos[0]+2,node.pos[1]-1
        pos3=node.pos[0]-2,node.pos[1]-1
        pos4=node.pos[0]-2,node.pos[1]+1

        pos5=node.pos[0]+1,node.pos[1]+2
        pos6=node.pos[0]+1,node.pos[1]-2
        pos7=node.pos[0]-1,node.pos[1]-2
        pos8=node.pos[0]-1,node.pos[1]+2
        newPositions=pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8
        return newPositions
    end

    def moves(newPos)
    end
end