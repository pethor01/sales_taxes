class NumberPrecision
	attr_accessor :number

	def initialize(number)
		@number = number
	end

	#return rounded number to the nearest 0.05
	def rounded_number
		(number * 20).ceil / 20.0
	end
	
	#return number to string with 2 two decimal
	def number_with_precision
		"%.2f" % number
	end
  
end