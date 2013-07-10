require 'spec_helper'

describe OrderGenerator do 

  describe "#initialize" do
    it "raises error when not given a menu file" do
      expect { OrderGenerator.new }.to raise_error(ArgumentError)
    end 

    it "raises error when given empty menu file" do
      expect { create_generator("empty_menu.txt") }.to raise_error(ArgumentError)
    end    

    it "sets price" do
      generator = create_generator("menu.txt")
      generator.price.should be    
    end

    it "sets menu items" do
      generator = create_generator("menu.txt")
      generator.price.should be    
    end

    it "sets possible orders" do
      generator = create_generator("menu.txt")
      generator.price.should be
    end 
  end

  describe "#orders" do
    it "returns matching orders for menu file with matches" do
      fruit = MenuItem.new("mixed fruit", "2.15")
      salad = MenuItem.new("side salad", "3.35")
      wings = MenuItem.new("hot wings", "3.35")     
      generator = create_generator("menu.txt")
      generator.orders.should match_array([[fruit, salad], [fruit, wings]])
    end

    it "returns [] for menu file with no matches" do
      generator = create_generator("no_match_menu.txt")
      generator.orders.should match_array([])
    end

    it "returns [] for invalid menu file" do
      generator = create_generator("invalid_menu.txt")
      generator.orders.should match_array([])
    end       
  end

  def create_generator(file_name)
    OrderGenerator.new("spec/data/#{file_name}")  
  end
end