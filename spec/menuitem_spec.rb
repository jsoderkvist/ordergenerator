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
	
	describe "#==" do
		it "compares name and price" do
			@item.==(MenuItem.new("name", "2.25")).should be_true 
		end

		it "compares price" do
			@item.==(MenuItem.new("name", "2.50")).should be_false 
		end

		it "compares name" do
			@item.==(MenuItem.new("other", "2.25")).should be_false 
		end		
	end

	describe "#eql?" do
		it "compares name and price" do
			@item.eql?(MenuItem.new("name", "2.25")).should be_true 
		end	
	end

	describe "#hash" do
		it "generates same value for equivalent items" do
			@item.hash.should eql MenuItem.new("name", "2.25").hash
		end
	end
end