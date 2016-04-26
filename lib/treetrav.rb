# Two types of searches:

# Depth:   ------------------------------
# Depth first search is all about going deeper into the tree structure
# and exhausting the "children" objects before moving on to the siblings.

# Breadth: ------------------------------
# Breadth first search checks the items in order of their distance from the
# root node. First the algorithm will check each of it's children. Then it
# will move down to the second tier, which is its children's children. After
# that it will check it's childrens' childrens' children.

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
    children.each do |child|
      return child if child.payload == needle

    end

    end
    return nil
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