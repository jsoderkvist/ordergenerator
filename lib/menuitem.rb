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

	def ==(other)
    	@name == other.name && @price == other.price
 	end

	def hash
		[@name, @price].hash
	end

	alias :eql? :==
end