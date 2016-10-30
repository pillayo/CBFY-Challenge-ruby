class Catalog
	class << self
		undef_method :new

		def products
			@products ||= []
		end
		def init_catalog
			products.push Product.new("VOUCHER", "Cabify Voucher", 5.00)
			products.push Product.new("TSHIRT", "Cabify T-Shirt", 20.00)
			products.push Product.new("MUG", "Cafify Coffee Mug", 7.50)
		end
		def find(code)
			products.find {|p| p.code == code }
		end
	end
end
