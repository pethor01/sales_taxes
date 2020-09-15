require './app/models/receipt'
require './app/models/item'
require './lib/tax_rate'
require './app/format/number_precision'

describe Receipt do
	let(:input1) { Item.new(1, 'book', 12.49) }
	let(:input2) { Item.new(1, 'music cd', 14.99) }
	let(:input3) { Item.new(1, 'chocolate bar', 0.85) }

	let(:receipt) { Receipt.new }
	describe 'add_item' do
		let(:items) { receipt.add_item(input1) }
		
		it 'has 1 item' do
			expect(items[0]).to  eq input1
		end
	end

	describe 'total_price_with_taxes and total taxes' do
		let(:total_price_with_taxes) { receipt.total_price_with_taxes }
		let(:total_taxes) { receipt.total_taxes }

		before do
			inputs = [input1, input2, input3]
			inputs.each { |input| receipt.add_item(input) }
    end
    
		it 'return total price with taxes' do
			expect(total_price_with_taxes).to  eq "29.83"
			expect(total_taxes).to  eq "1.50"
    end
  end

    
end