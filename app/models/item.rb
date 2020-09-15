
class Item
  
  attr_accessor :quantity, :product, :price

  def initialize(quantity, product, price)
    @quantity = quantity
    @product = product
    @price = price    
  end

  def item_format
    [
      quantity,
      " #{product}",
      " #{NumberPrecision.new(tax_price).number_with_precision}"
    ]
  end
  
  def tax_price
    (total_price + taxes).round(2)
  end

  def taxes
    get_tax = TaxRate.new(product)
    total_price_with_tax = NumberPrecision.new((total_price * get_tax.tax_rate)).rounded_number
  end
  
  private

  def total_price
    quantity * price
  end

end