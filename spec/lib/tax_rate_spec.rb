require "./lib/tax_rate"

describe TaxRate do
  let(:tax_rate) { TaxRate.new(product) }

  describe "tax_rates" do
    context "a product with basic tax" do
      let(:product) { "music cd" }
      let(:subject) { tax_rate.tax_rate }

      it "return tax rate" do
        expect(subject).to eq 0.1
      end
		end
		
		context "a product with exempt tax" do
      let(:product) { "books" }
      let(:subject) { tax_rate.tax_rate }

      it "return tax rate" do
        expect(subject).to eq 0
      end
		end
		
    context "imported product" do
      let(:product) { "imported box of chocolates" }
      let(:subject) { tax_rate.tax_rate }

      it "return tax rate" do
        expect(subject).to eq 0.05
      end
    end

    context "imported and non exempt tax product" do
      let(:product) { "imported bottle of perfume" }
      let(:subject) { tax_rate.tax_rate.round(2)}

      it "return tax rate" do
        expect(subject).to eq 0.15
      end
    end
  end
end