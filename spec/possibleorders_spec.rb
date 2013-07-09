require 'spec_helper'

describe PossibleOrders do 

	describe "#initialize" do
		it "raises error if non-existent menu file is provided" do
			expect{PossibleOrders.new("")}.to raise_error(ArgumentError)
		end	

		it "raises error if non-existent menu file is provided" do
			expect{PossibleOrders.new("spec/empty_menu.txt")}.to raise_error(ArgumentError)
		end			
	end

	describe "#orders" do
		let(:fruit) { MenuItem.new("mixed fruit", "2.15") }
		let(:salad) { MenuItem.new("side salad", "3.35") }
		let(:wings) { MenuItem.new("hot wings", "3.35") }

		it "returns matching orders for menu file with matches" do
			expected = [[fruit, salad], [fruit, wings]]
			PossibleOrders.new("spec/menu.txt").orders.should match_array(expected)
		end

		it "returns []] for menu file with no matches" do
			PossibleOrders.new("spec/no_match_menu.txt").orders.should match_array([])
		end

		it "returns [] for invalid menu file" do
			PossibleOrders.new("spec/invalid_menu.txt").orders.should match_array([])
		end				
	end
end