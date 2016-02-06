# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Startup Data for testing
event1 = Event.create(title: 'Small Mid Day Banger', swag: 'true', food: 'false', prizes: 'false', confirmed_attendees: '900', street: '1864 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event2 = Event.create(title: 'Study Sesshhh', swag: 'true', food: 'false', prizes: 'true', confirmed_attendees: '200', street: '330 NEWELL DR', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event3 = Event.create(title: 'Super Smash Bros Tourney', swag: 'true', food: 'false', prizes: 'true', confirmed_attendees: '3300', street: '1765 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')

event4 = Event.create(title: 'Flash Mob Meeting', swag: 'true', food: 'true', prizes: 'false', confirmed_attendees: '500', street: '2001 MUSEUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event5 = Event.create(title: 'Basketball Game', swag: 'false', food: 'true', prizes: 'true', confirmed_attendees: '340', street: '330 NEWELL DR', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event6 = Event.create(title: 'Clarifai Infosession', swag: 'true',  food: 'false', prizes: 'true', confirmed_attendees: '2344',street: '1765 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')


Event.create(title: 'SWAMPHACKS!!!!', food: 'true',  swag: 'true', prizes: 'true',confirmed_attendees: '4000',street: '444 NEWELL DR ', city: 'Gainesville', state:  'Florida', zip_code: '32611')

#automatically sets up organizer and attendee role objects
['organizer', 'attendee'].each do |role|
  Role.find_or_create_by({name: role})
end
