module OrderGenerator
	class MenuItem
		attr_reader :name, :price

		def initialize(name, price)
			@name = name
			@price = price
		end

		def to_s
			"#{@name}, $#{@price}"
		end
	end

	module_function

	def find_possible_orders(file_path)
		puts file_path
		price = read_target_price(file_path)
		items = read_menu_items(file_path)
		all_combos = generate_combinations(items)
		puts all_combos
		valid_combos = find_combinations_with_price(all_combos, price)
		if valid_combos.size > 0
			puts "Here are the possible orders:"
			valid_combos.each { |c| puts c }
		else
			puts "No matching orders found"
		end
	end

	def generate_combinations(items)
		all_combinations = []
		1.upto(items.size) do |n|
			all_combinations.push(*items.combination(n))
		end
		all_combinations
	end

	def find_combinations_with_price(combos, price)
		combos.map{ |c| c if c.inject(0){ |total, item| total + item.price.to_i } == price }.compact
	end

	def read_menu_items(file_path)
		items = []
		File.open(file_path, "r").each_line.with_index do |line, line_num|
			next if line_num == 0
			name, price = line.split(',$')
			items << MenuItem.new(name, price)
		end
		#puts "Menu Items:"
		#puts items
		items
	end

	def read_target_price(file_path)
		price = File.open(file_path).first
		puts "Target price: #{price}"
	end
end

OrderGenerator.find_possible_orders "menu.txt"