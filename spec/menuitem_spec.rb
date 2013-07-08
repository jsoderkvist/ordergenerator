require 'spec_helper'

describe MenuItem do 
	before :each do
		@item = MenuItem.new("name", "2.25")
	end

	describe "#to_s" do
		it "formats name and price with symbol" do
			@item.to_s.should eql "name ($2.25)"
		end
	end
	
end