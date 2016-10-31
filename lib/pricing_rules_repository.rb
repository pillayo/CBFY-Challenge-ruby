#Repository of discount type, override module for add new discount type
module PricingRulesRepository
	
	#One € if you buy more than two products of the same type
	def PricingRulesRepository.rule_discount_one_more_two
		Proc.new { |count| count > 2 ? (count * 1.0) : 0.0 }
	end

	#buy two of the same product, get one free
	def PricingRulesRepository.rule_two_free_one
		Proc.new { |count, price|  (count / 2) * price}
	end
end