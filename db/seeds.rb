# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: 'Monk 2', description: 'Monk the greatest man part 2', 
  large_cover_url: 'monk_large.jpg', small_cover_url: 'monk.jpg', category_id: 1)
# Video.create(title: 'Family guy', description: 'Video for my myflix account, second one', 
#   large_cover_url: 'monk_large.jpg', small_cover_url: 'family_guy.jpg', category_id: 1)
# Video.create(title: 'Futurama', description: 'Whats up with you dawg. T his is the Christ freedom', 
#   large_cover_url: 'monk_large.jpg', small_cover_url: 'futurama.jpg', category_id: 1)
# Video.create(title: 'South Park in the bay', description: 'We chilling in the bay area dawg', 
#   large_cover_url: 'monk_large.jpg', small_cover_url: 'south_park.jpg', category_id: 1)

# Category.create(name: 'TV Commedies')
# Category.create(name: 'TV Dramas')
# Category.create(name: 'Reality TV')

