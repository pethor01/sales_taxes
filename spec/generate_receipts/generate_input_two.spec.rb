require './app/generate_receipt'
require './app/input_data/input_data'
require './app/models/receipt'
require './app/format/number_precision'
require './lib/tax_rate'
require './app/models/item'


describe GenerateReceipt do
	context "get input_data for input_2" do
		let(:receipt) { Receipt.new }
		let(:input_1) { Item.new(1, "imported box of chocolates", 10.00) }
		let(:input_2) { Item.new(1, "imported bottle of perfume", 47.50) }

		let(:result) do
			[
				[1, " imported box of chocolates", " 10.50"],
				[1, " imported bottle of perfume", " 54.65"],
				[],
				[],
				["Sales Taxes: 7.65"],
				["Total: 65.15"]
			]
		end

		before do
			inputs = [input_1, input_2]
			inputs.each { |input| receipt.add_item(input) }
		end

		let(:generate_receipt) { GenerateReceipt.new(receipt).print_receipt } 
			it "print the receipt in csv" do
				expect(result).to  eq generate_receipt		
			end
    end
    
end
