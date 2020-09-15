
require './app/models/item'
require './lib/tax_rate'
require './app/format/number_precision'

describe Item do
  describe "when item is added" do
    let(:book) {new_item(1, "book", 12.49)  }
    let(:music_cd) {new_item(1, "music_cd", 14.99)  }

    describe "item book is create" do
      let(:total_price) {book.taxes + book.price}
      it "create item book" do
        expect(book.quantity).to eq @qty
        expect(book.product).to eq @prod
        expect(book.price).to eq @price
      end

      it "return total book price " do
        expect(book.taxes).to eq 0
        expect(book.tax_price).to eq total_price
      end
      
    end

    describe "item music cd is create" do
      let(:total_price) {music_cd.tax_price}
      it "create music cd" do
        expect(music_cd.quantity).to eq @qty
        expect(music_cd.product).to eq @prod
        expect(music_cd.price).to eq @price
      end

      it "return total music cd price with tax" do
        expect(music_cd.taxes).to eq 1.50
        expect(music_cd.tax_price).to eq total_price
      end

      it "return item format" do
        item_format =  music_cd.item_format
        expect(item_format).to eq [music_cd.quantity, " #{music_cd.product}", " #{music_cd.tax_price}"]
      end
      
    end
  end

  def new_item(qty, prod, price)
    @qty = qty
    @prod = prod
    @price = price
    @item = Item.new(qty, prod, price)
  end

end
