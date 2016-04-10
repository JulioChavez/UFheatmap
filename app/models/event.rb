class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	has_and_belongs_to_many :users

	after_validation :geocode
	def address
 	 [street, city, state, zip_code].compact.join(', ')
	end

	def increment_attendance
		# current_user = User.find(params[:id])
		current_user = User.find(1)
		puts("BEFORE SAVE, Attendee List: #{self.users}")

		# Check if Attendee is already attending this Event
		if (!self.users.include?(current_user))
			puts("User \"#{current_user.first_name} #{current_user.last_name}\" added to Event \"#{self.title}\"")

			# Increment Attendee count for this Event
			self.confirmed_attendees ||= 0
			self.confirmed_attendees += 1

			# Add Attendee to the list of attedees in this Event
			self.users << current_user
			self.save!

			puts("AFTER SAVE, Attendee List: #{self.users}")
		end

	end
end
