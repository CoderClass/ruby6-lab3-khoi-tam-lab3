class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical
    Product.order(:name)
  end
  
  def discount_amount
    if price_vnd > 800_000
      return (price_vnd * 0.59).round
    elsif price_vnd > 200_000
      return (price_vnd * 0.69).round
    elsif price_vnd > 100_000
      return (price_vnd * 0.79).round
    else
      price_vnd
    end
  end

  def on_sale?
    price_vnd != discount_amount
  end

  def final_price
    puts discount_amount
    (discount_amount / 10000.0).ceil * 10000
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end


end
