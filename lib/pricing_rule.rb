class PricingRule

	def initialize(product, rule)
		@product  = product 	
		@rule = rule    	
  	end

  	def discount(products)
  		products_count = products_selected_count products
  		@rule.call products_count,@product.price
  	end

  	private

  	def products_selected_count(products)
  		products.size > 0 ? products.select { |p| p.code == @product.code }.size : 0
  	end
end