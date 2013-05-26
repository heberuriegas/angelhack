# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Categories

Category.where(title: 'Arts & Entertainment').first_or_create
Category.where(title: 'College & University').first_or_create
Category.where(title: 'Food,').first_or_create
Category.where(title: 'Food & Drink Shop').first_or_create
Category.where(title: 'Gym / Fitness Center').first_or_create
Category.where(title: 'Nightlife Spot').first_or_create
Category.where(title: 'Outdoors & Recreation').first_or_create
Category.where(title: 'Professional & Other Places').first_or_create
Category.where(title: 'Residence, Shop & Service').first_or_create
Category.where(title: 'School').first_or_create
Category.where(title: 'Shop & Service').first_or_create
Category.where(title: 'Travel & Transport').first_or_create
Category.where(title: 'Other').first_or_create