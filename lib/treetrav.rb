require "queue"

class Tree
  attr_reader :payload, :children

  def initialize(payload, children=[])
    @payload = payload
    @children = children
  end


  def depth_search(needle)
    return self if @payload == needle
    children.each do |child|
      tree = child.depth_search(needle)
      return tree unless tree.nil?
    end
    return nil
  end

  def breadth_search(needle)
    return self if @payload == needle
    backlog = Queue.new
    children.each do |child|
      return child if child.payload == needle
      backlog.enqueue(child)      
    end
    current_node = backlog.dequeue
    return current_node.breadth_search(needle) unless current_node.nil?
  end


end
















# # The "Leafs" of a tree, elements that have no children
# deep_fifth_node = Tree.new(5, [])
# eleventh_node = Tree.new(11, [])
# fourth_node   = Tree.new(4, [])

# # The "Branches" of the tree
# ninth_node = Tree.new(9, [fourth_node])
# sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
# seventh_node = Tree.new(7, [sixth_node])
# shallow_fifth_node = Tree.new(5, [ninth_node])

# # The "Trunk" of the tree
# trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])