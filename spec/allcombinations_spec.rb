require 'spec_helper'

describe AllCombinations do
  class DummyClass
  end

  before :all do
    @dummy = DummyClass.new
    @dummy.extend AllCombinations
  end 

  describe "#generate_all_combinations" do
    it "generates an empty array for an empty array" do
      @dummy.generate_all_combinations([]).should eql []
    end
  end

  describe "#generate_all_combinations" do
    it "generates a single combination for a single item array" do
      @dummy.generate_all_combinations([1]).should eql [[1]]
    end
  end

  describe "#generate_all_combinations" do
    it "generates 7 combinations for an array of 3 items" do
      items = [1, 2, 3]
      expected = [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
      @dummy.generate_all_combinations(items).should match_array(expected)
    end
  end
end