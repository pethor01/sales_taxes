require './app/generate_receipt'
require './app/input_data/input_data'
require './app/models/receipt'
require './app/format/number_precision'
require './lib/tax_rate'
require './app/models/item'


describe GenerateReceipt do
	context "get input_data for input_2" do

		let(:receipt) { Receipt.new }
		let(:input_1) { Item.new(1, "imported bottle of perfume", 27.99) }
		let(:input_2) { Item.new(1, "bottle of perfume", 18.99) }
		let(:input_3) { Item.new(1, "packet of headache pills", 9.75) }
		let(:input_4) { Item.new(1, "box of imported chocolates", 11.25) }

		let(:result) do
			[
				[1, " imported bottle of perfume", " 32.19"],
				[1, " bottle of perfume", " 20.89"],
				[1, " packet of headache pills", " 9.75"],
				[1, " box of imported chocolates", " 11.85"],
				[],
				[],
				["Sales Taxes: 6.70"],
				["Total: 74.68"]
			]
		end

		before do
			inputs = [input_1, input_2, input_3, input_4]
			inputs.each { |input| receipt.add_item(input) }
		end

		let(:generate_receipt) { GenerateReceipt.new(receipt).print_receipt } 
			it "print the receipt in csv" do
				expect(result).to  eq generate_receipt		
			end
    end
    
end
