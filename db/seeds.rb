# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS News engine
Refinery::News::Engine.load_seed

# Added by Refinery CMS Slideshow Images extension
Refinery::SlideshowImages::Engine.load_seed

# Added by Refinery CMS Faculty Members extension
Refinery::FacultyMembers::Engine.load_seed

# Added by Refinery CMS Ba Buttons extension
Refinery::BaButtons::Engine.load_seed
