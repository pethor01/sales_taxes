require "./app/generate_receipt"
require './app/models/receipt'
require './app/format/number_precision'
require "./lib/tax_rate"
require './app/models/item'


describe GenerateReceipt do
	context 'get input_data for input_1' do
		let(:receipt) { Receipt.new }
		let(:input1) { Item.new(1, "book", 12.49) }
		let(:input2) { Item.new(1, "music cd", 14.99) }
		let(:input3) { Item.new(1, "chocolate bar", 0.85) }

		before do
			inputs = [input1, input2, input3]
			inputs.each { |input| receipt.add_item(input) }
		end
		let(:generate_receipt) { GenerateReceipt.new(receipt).print_receipt } 
		let(:result) do
			[
				[1, " book", " 12.49"],
				[1, " music cd", " 16.49"],
				[1, " chocolate bar", " 0.85"],
				[],
				[],
				["Sales Taxes: 1.50"],
				["Total: 29.83"]
			]
		end
        it 'print the receipt in csv' do
			expect(result).to  eq generate_receipt		
		end
	end
end
