require 'bigdecimal'
require_relative 'menuitem'
require_relative 'allcombinations'

class OrderGenerator

  include AllCombinations

  attr_reader :price, :menu_items, :orders

  def initialize(file_path)
    if !File.exists?(file_path) || File.zero?(file_path)
      raise ArgumentError.new("non-existent or empty menu file") 
    end
    @price = read_target_price(file_path)
    @menu_items = read_menu_items(file_path)
    @orders = find_possible_orders
  end   

  private

  def find_possible_orders
    items_to_consider = @menu_items.reject {|i| i.price > @price }
    all_combos = generate_all_combinations(items_to_consider)
    matching_combos = all_combos.map do |c| 
      total_price = c.inject(0) { |total, item| total + item.price }
      c if total_price == @price
    end
    matching_combos.compact 
  end 

  def read_menu_items(file_path)
    items = []
    File.open(file_path, "r").each_line.with_index do |line, line_num|
      next if line_num == 0
      name, price = line.split(',$')
      items << MenuItem.new(name, price)
    end
    items
  end

  def read_target_price(file_path)
    price = File.open(file_path).first
    price.slice!(0)
    BigDecimal.new(price)
  end
end

if __FILE__ == $PROGRAM_NAME
  possible_orders = OrderGenerator.new(ARGV[0]).orders
  if possible_orders.size > 0
    puts "Here are the possible orders:"
    possible_orders.each do |order| 
      puts "----"
      puts order
    end
  else
    puts "No matching orders found"
  end
end