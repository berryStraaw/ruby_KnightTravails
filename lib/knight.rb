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
        node.paths=newPositions(node)
        return node
    end

    def find_node(pos,node=@root)
        @root=build_tree(@root.pos)
        que=[@root]
        nodesMade=0
        current=que[0]
        while current.pos!=pos
            current.paths.map! do |path|
                nodesMade+=1
                node=Node.new(path)
                node.paths=newPositions(node)
                node
            end
            current.paths.each  do |node|
                que.push(node)
            end
            que.shift
            current=que[0]
        end
        p que[0]
    end

    def find_node_child(pos,node=@root)
        @root=build_tree(@root.pos)
        if pos==@root.pos
            return @root
        end
        que=[@root]
        current=que[0]
        check=true
        while check
            if current.paths.include?(pos)
                check=false
                break
            end
            current.paths.map! do |path|
                node=Node.new(path)
                node.paths=newPositions(node)
                node
            end
            current.paths.each  do |node|
                que.push(node)
            end
            que.shift
            current=que[0]
        end
        return que[0]
    end
    
    def path(val,arr=[])
        if val==@root.pos
            arr.reverse!
            return arr
        else
            arr<<find_node_child(val).pos
            path(find_node_child(val).pos,arr)
            
        end
        
    end
    def newPositions(node)
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
        newPositions.map! do |posarr|
            if posarr[0]<0
                nil
            elsif posarr[1]<0
                nil
            else
                posarr
            end
        end
        return newPositions.compact
    end
end