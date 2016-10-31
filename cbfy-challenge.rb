Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

#Init the catalog of products, Catalog this is a singleton
Catalog.init_catalog

#Link Product with discount type
rule1 = PricingRule.new(Catalog.find("TSHIRT"), PricingRulesRepository.rule_discount_one_more_two)
rule2 = PricingRule.new(Catalog.find("VOUCHER"), PricingRulesRepository.rule_two_free_one)

pricing_rules = [rule1,rule2]

co1 = Checkout.new("€",pricing_rules)
co1.scan("VOUCHER")
co1.scan("TSHIRT")
co1.scan("MUG")
puts co1.description
puts

co2 = Checkout.new("€",pricing_rules)
co2.scan("VOUCHER")
co2.scan("TSHIRT")
co2.scan("VOUCHER")
puts co2.description
puts

co3 = Checkout.new("€",pricing_rules)
co3.scan("TSHIRT")
co3.scan("TSHIRT")
co3.scan("TSHIRT")
co3.scan("VOUCHER")
co3.scan("TSHIRT")
puts co3.description
puts

co4 = Checkout.new("€",pricing_rules)
co4.scan("VOUCHER")
co4.scan("TSHIRT")
co4.scan("VOUCHER")
co4.scan("VOUCHER")
co4.scan("MUG")
co4.scan("TSHIRT")
co4.scan("TSHIRT")
puts co4.description
puts
