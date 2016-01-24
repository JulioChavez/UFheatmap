class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	after_validation :geocode, if: ->(event){ event.address.present? and event.location_changed? }
	def address
 	 [street, city, state, country].compact.join(', ')
	end
end
