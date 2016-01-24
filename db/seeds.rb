# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event1 = Event.create(title: 'Small Mid Day Banger', confirmed_attendees: '900', street: '1864 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event2 = Event.create(title: 'Study Sesshhh', confirmed_attendees: '200', street: '330 NEWELL DR', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event3 = Event.create(title: 'Super Smash Bros Tourney', confirmed_attendees: '3300', street: '1765 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')

event4 = Event.create(title: 'Flash Mob Meeting', confirmed_attendees: '500', street: '2001 MUSEUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event5 = Event.create(title: 'Basketball Game', confirmed_attendees: '340', street: '330 NEWELL DR', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event6 = Event.create(title: 'Clarifai Infosession',  confirmed_attendees: '2344',street: '1765 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')


Event.create(title: 'SWAMPHACKS!!!!', confirmed_attendees: '4000',street: '444 NEWELL DR ', city: 'Gainesville', state:  'Florida', zip_code: '32611')
