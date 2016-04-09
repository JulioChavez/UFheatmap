class Event < ActiveRecord::Base
	geocoded_by :address # replace location with the attribute of the address

	has_and_belongs_to_many :users

	after_validation :geocode
	def address
 	 [street, city, state, zip_code].compact.join(', ')
	end

	def increment_attendance
		self.confirmed_attendees ||= 0
		self.confirmed_attendees += 1
		self.save!

		# current_user = User.find(params[:id])
		current_user = User.find(1)
		puts("Attendee ID: #{current_user.id}")
		puts("Event ID: #{self.id}")
		puts("Attendee List: #{self.users}")
		# self.users.create(id: current_user.id)
		# self.users << current_user
		# self.save
	end
end
