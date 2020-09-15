class TaxRate
  # basic_tax 10%, all_imported item have 5%, exempt_tax_item books, foods, medicines
  attr_accessor :product

  def initialize(product)
    @product = product
  end

  def tax_rate
    exempt_tax_products = %w(book chocolate pills)
    tax = 0
    tax += compute_tax(10) unless exempt(exempt_tax_products)
    tax += compute_tax(5) if imported_item
    tax
  end

  private

  def compute_tax(percent)
    percent.to_f / 100
  end

  def exempt(exempt_products)
    exempt_products.any? { |exempt| product.include?(exempt) }
  end

  def imported_item
    product.include?('imported')
  end
      
end

