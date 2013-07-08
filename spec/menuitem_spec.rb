require 'spec_helper'

describe MenuItem do 
	before :all do
		@item = MenuItem.new("name", "2.25")
	end

	describe "#name" do
		it "returns item name" do
			@item.name.should eql "name"
		end
	end

	describe "#price" do
		it "returns item price as BigDecimal" do
			@item.price.should eql BigDecimal.new("2.25")
		end
	end	

	describe "#to_s" do
		it "formats name and price with symbol" do
			@item.to_s.should eql "name ($2.25)"
		end
	end
	
end