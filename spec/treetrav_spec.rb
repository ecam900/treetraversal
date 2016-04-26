require "treetrav"
require "queue"

describe Tree do
	describe "::initialize" do
		context "when no arguments are provided" do
			it "returns an error" do
				expect { Tree.new }.to raise_error(ArgumentError)
			end
		end
	end

	describe "#payload" do
		it "returns the payload provided in the initializer" do
			expect(described_class.new(5).payload).to eq 5
		end
	end

	describe "#children" do
		context "when no argument for children is given" do
			it "returns an empty array" do
				expect(described_class.new(5).children).to eq []
			end
		end

		context "an argument for children is given" do
			it "returns the children" do
				children = [Tree.new(4), Tree.new(3)]
				expect(described_class.new(5,children).children).to eq children
			end
		end
	end

	describe "#depth_search" do
		context "when the searched number is in the tree" do
			context "when the trunk node has the searched payload" do
				it "returns the trunk" do
					trunk = Tree.new(10, [Tree.new(5), Tree.new(4)])
					expect(trunk.depth_search(10)).to eq trunk
				end
			end

			context "when the node being searched for is a child" do
				context "when the node being searched for is on the left" do
					it "returns the node" do
						searched = Tree.new(1)
						tree = Tree.new(10, [searched, Tree.new(4)])
						expect(tree.depth_search(1)).to eq searched
					end
				end

				context "when the node being searched for is on the right" do
					it "returns the node" do
						searched = Tree.new(1)
						tree = Tree.new(10, [Tree.new(4), searched])
						expect(tree.depth_search(1)).to eq searched
					end
				end
			end
		end

		context "when the searched number is NOT in the tree" do
			it "returns nil" do
				tree = Tree.new(4)
				expect(tree.depth_search(5)).to be_nil
			end
		end
	end

	describe "#breadth_search" do
		context "when given the searched number is in the tree" do

			context "when the number being searched for is the 'trunk' " do
				it "returns the 'trunk' " do
					trunk = Tree.new(5)
					expect(trunk.breadth_search(5)).to eq trunk
				end
			end
		end
	end
end