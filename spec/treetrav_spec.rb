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
		context "no argument for children is given" do
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
end