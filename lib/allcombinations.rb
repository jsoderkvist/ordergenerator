module AllCombinations
	
	def generate_all_combinations(items)
		all_combinations = []
		1.upto(items.size) { |n| all_combinations.push(*items.combination(n)) }
		all_combinations
	end
end