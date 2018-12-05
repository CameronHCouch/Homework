require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "cameron") }
  subject(:dessert) {Dessert.new('brownie', 4, chef)}

  describe "#initialize" do
    it "sets a type" do
    expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('brownie', 'four', 'cameron') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to be_empty
      dessert.add_ingredient('butter')
      expect(dessert.ingredients).to include('butter')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient('banana')
      dessert.add_ingredient('carrot')
      dessert.add_ingredient('chocolate')
      dessert.add_ingredient('coconut')
      pre_shuffle = dessert.ingredients.dup
      expect(dessert.ingredients.shuffle!).not_to eq(pre_shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"do
    dessert.eat(2)
    expect(dessert.quantity).to eq(2)
  end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(500) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Cameron the Great Baker")
      expect(dessert.serve).to eq("Chef Cameron the Great Baker has made 4 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
