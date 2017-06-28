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
end
