# spec/calculator_spec.rb

require './lib/calculator'

describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe '#multiply' do
    it 'returns the product of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(10, 5)).to eql(50)
    end

    it 'returns the product of more than 2 numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(2, 3, 4)).to eql(24)
    end
  end
end

# describe is an RSpec keyword that defines an "Example Group", or a collection of tests. Takes a class or string and is passed a block (do/end).

# it is a keyword that defines the individual example (test). Takes a string argument and is also passed a block.

# In the case above, when we pass 5 and 2 to the #add method, we expect it to return 7. This is expressed in our expectation clause
