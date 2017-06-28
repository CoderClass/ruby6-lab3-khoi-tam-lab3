require 'rails_helper'

RSpec.describe Product, type: :model do
  describe ".alphabetical" do
    it "return empty if there is no product" do
      expect(Product.alphabetical).to eq([])
    end

    it "must be sorted" do
      %w(a b c).each {|name| Product.create(name: name) }
      expect(Product.alphabetical.map(&:name)).to eq(["a","b","c"])
    end
  end

  describe "product discount" do
    before do
      @a = Product.new name: "A", price_vnd: 150000
      @b = Product.new name: "B", price_vnd: 250000
      @c = Product.new name: "C", price_vnd: 850000
    end

    it "#discount_amount" do
      expect(@a.discount_amount).to eq (150000 * 0.79)
      expect(@b.discount_amount).to eq (250000 * 0.69)
      expect(@c.discount_amount).to eq (850000 * 0.59)
    end

    it "#final_price" do
      expect(@a.final_price).to eq 120000
      expect(@b.final_price).to eq 180000
      expect(@c.final_price).to eq 510000
    end
  end
end
