# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "1.starting.."

puts "2.Creating a user"
Mission.destroy_all
Tagging.destroy_all
Note.destroy_all
User.destroy_all
Tag.destroy_all

User.create!(email: 'ellyn@gmail.com', password: '123456')

puts "3.creating mission"
Mission.create!(company: 'Le Wagon', location: 'SF', start_date: Date.today, end_date: Date.today + 1, title: 'rails module', user: User.last)

puts "4.creating tags"
['ruby', 'sql', 'rails', 'html', 'css', 'js', 'gems'].each do |tag|
  Tag.create!(name: tag)
end

puts "5.creating taggings"
Tagging.create!(tag_id: Tag.last.id, taggable_id: Mission.last.id, taggable_type: 'Mission')

puts "6.finished.."


