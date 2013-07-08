require 'bigdecimal'
require_relative 'menuitem'
require_relative 'allcombinations'

class OrderGenerator

	include AllCombinations

	def find_possible_orders(file_path)
		price = read_target_price(file_path)
		items = read_menu_items(file_path)
		all_combos = generate_all_combinations(items)
		valid_combos = find_combinations_with_price(all_combos, price)
		print_orders(valid_combos)
	end

	private

	def print_orders(orders)
		if orders.size > 0
			puts "Here are the possible orders:"
			orders.each do |order| 
				puts "----"
				puts order
			end
		else
			puts "No matching orders found"
		end
	end		

	def find_combinations_with_price(combos, price)
		matching_combos = combos.map do |c| 
			total_price = c.inject(0){ |total, item| total + item.price }
			c if total_price == price
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

generator = OrderGenerator.new
generator.find_possible_orders ARGV[0]