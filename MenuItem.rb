class MenuItem
	attr_reader :name, :price

	def initialize(, price)
		@name = name
		@price = price
	end

	def to_s
		"#{@name}, #{@price}"
	end
end