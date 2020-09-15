class Receipt

	attr_accessor :items
	
  def initialize
    @items = Array.new
  end

  def add_item(item)
    items.push(item)
	end
	
	def total_price_with_taxes
		total = items.inject(0) { |sum, item| sum + item.tax_price }
		total_with_precision = NumberPrecision.new(total).number_with_precision
	end

	def total_taxes
		total = items.inject(0) { |sum, item| sum + item.taxes }
		total_with_precision = NumberPrecision.new(total).number_with_precision          
	end
	
end