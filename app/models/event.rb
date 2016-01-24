class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	after_validation :geocode
	def address
 	 [street, city, state, ].compact.join(', ')
	end
end
