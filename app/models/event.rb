class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	after_validation :geocode
	def address
 	 [street, city, state, zip_code].compact.join(', ')
	end
end
