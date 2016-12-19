class Binary_Tree
  attr_accessor :root_node

  def initialize(arr)
    @root_node = Node.new(arr[0])
    build_tree(arr)
  end

  def build_tree(arr)
    arr.each do |value|
      new_node = Node.new(value)
      place_node(new_node, @root_node)
    end
  end

  def place_node(new_node, current_node)
    if new_node.value <= current_node.value
      if current_node.left_child
        place_node(new_node, current_node.left_child)
      else #attach as leaf
        current_node.left_child = new_node
        new_node.parent = current_node
      end
    elsif new_node.value > current_node.value
      if current_node.right_child
        place_node(new_node, current_node.right_child)
      else #attach as leaf
        current_node.right_child = new_node
        new_node.parent = current_node
      end
    end
  end

  def breadth_first_search(number, queue=[@root_node], depth=0)
    return nil if queue.empty?
    next_queue = []
    queue.each do |node|
      puts "#{node.value} is located at #{node}, at a depth of #{depth}" if number == node.value
      next_queue << node.left_child if node.left_child
      next_queue << node.right_child if node.right_child
    end
    queue = next_queue
    breadth_first_search(number, queue, depth+1)
  end


  def depth_first_search(number, current_node=@root_node, depth=0)
  	puts "#{current_node.value} is located at #{current_node}, at a depth of #{depth}" if number == current_node.value
  	if number < current_node.value
  		depth_first_search(number, current_node.left_child, depth+1) unless current_node.left_child.nil?
  	else number > current_node.value
  		depth_first_search(number, current_node.right_child, depth+1) unless current_node.right_child.nil?
  	end
  end

end

class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value)
    @value = value
  end

end

ordered_array = [1,2,3,5,8,11,19,23,26,35,42]
unordered_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Binary_Tree.new(unordered_array)
tree.breadth_first_search(324)
tree.depth_first_search(324)
