require 'bigdecimal'

class MenuItem
	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = BigDecimal.new(price)
	end

	def to_s
		"#{@name} ($#{'%.2f' % @price})"
	end
end