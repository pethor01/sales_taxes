require 'csv'

class GenerateReceipt
	attr_accessor :generate_receipt
	
	def initialize(generate_receipt)
		@generate_receipt = generate_receipt
	end

	def print_receipt
		CSV.open(output_filepath, 'wb') do |csv|
      print.each do |data|
				csv << data
      end
    end
	end
	
	private

	def print
		input = Array.new
		input += generate_receipt.items.map(&:item_format)
		input.push([])
		input.push([])
		input.push(["Sales Taxes: #{generate_receipt.total_taxes}"])
    input.push(["Total: #{generate_receipt.total_price_with_taxes}"])
	end

	def output_filepath
		time = Time.new.strftime("%S") 
		Dir.pwd + "/app/receipts_output/output#{time}.csv"
	end
	
end