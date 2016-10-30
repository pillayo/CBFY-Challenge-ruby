module PricingRulesRepository
	
	def PricingRulesRepository.rule_discount_one_more_two
		Proc.new { |count| count > 2 ? (count * 1.0) : 0.0 }
	end

	def PricingRulesRepository.rule_two_free_one
		Proc.new { |count, price|  (count / 2) * price}
	end
end