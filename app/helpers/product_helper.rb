module ProductHelper
  def self.product_discount_info(product)
    "More than #{100 * ((product.price_vnd - product.discount_amount) / product.price_vnd )} off!"
  end
end
