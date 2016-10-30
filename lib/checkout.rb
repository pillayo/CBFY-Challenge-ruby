class Checkout

	attr_reader :cart

	def initialize(currency = "€", rules = nil)
    	@cart = []
    	@currency = currency
      @rules = rules
  	end
  	
  	def scan(product_code)
  		product = Catalog.find product_code
  		@cart << product unless product.nil?
  	end  	  

  	def total
      total = total_without_discount      
      if (@rules)        
        @rules.each { |rule| total -= rule.discount @cart}
      end
      total  		
  	end

  	def total_without_discount 
      @cart.size > 0 ? @cart.map { |product| product.price }.inject(:+) : 0
  	end

  	def description
  		"Items: #{@cart.map{ |product| product.code }.join(", ")}\nTotal without discount: #{total_without_discount}#{@currency}\nTotal: #{total}#{@currency}"
  	end
end