# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event1 = Event.create(title: 'Made in Seed 1', street: '1864 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event2 = Event.create(title: 'Made in Seed 1', street: '330 NEWELL DR', city: 'Gainesville', state:  'Florida', zip_code: '32611')
event3 = Event.create(title: 'Made in Seed 1', street: '1765 STADIUM RD', city: 'Gainesville', state:  'Florida', zip_code: '32611')