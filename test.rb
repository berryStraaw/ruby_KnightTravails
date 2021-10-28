ar=[0,1,2,3]
ar.map!{|item| item+2}
#p ar

array=[[2,1],[1,2]]
check=false
array.each do |item|
    p item
    if item.include?([2,1])
        check=true
    end
end
p check
p array.include?([2,1])
p [[2,1],[1,2]].exclude?([2,1])

