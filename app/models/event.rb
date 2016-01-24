class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	after_validation :geocode
	def address
 	 [street, city, state, ].compact.join(', ')
	end

	def increment_attendance
		self.confirmed_attendees ||= 0
		self.confirmed_attendees += 1
		self.save!
	end
end
