class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	has_and_belongs_to_many :users

	after_validation :geocode
	def address
 	 [street, city, state, zip_code].compact.join(', ')
	end

	def increment_attendance
		# current_user = User.find(params[:id])
		# current_user = User.find(1)
		puts("BEFORE SAVE, Attendee List: #{self.users}")

		# Check if Attendee is already attending this Event
		self.confirmed_attendees ||= 0
		self.confirmed_attendees += 1
		self.save!

		puts("AFTER SAVE, Attendee List: #{self.users}")
		# end

	end
end
