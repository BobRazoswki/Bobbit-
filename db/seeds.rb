# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.destroy_all

1.upto(11) do |n| 
	#tags = %w(#Bob, #Alex, #Marco, #Jamie, #Jean, #Joe, #Nikesh).sample(2).join(' ')
	Post.create(title: "#{n} title", content: "this is the post N°#{n} Hella beard selvage paleo actually Intelligentsia, craft beer plaid bicycle rights irony 3 wolf moon brunch. Helvetica before they sold out PBR hoodie semiotics four loko direct trade synth street art",picture: File.new(Rails.root.join 'spec/images/' + "Bob_razowski-#{n}.jpg") )
end