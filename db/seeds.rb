Post.destroy_all

1.upto(11) do |n| 
	#tags = %w(#Bob, #Alex, #Marco, #Jamie, #Jean, #Joe, #Nikesh).sample(2).join(' ')
	Post.create(title: "#{n} title", content: "this is the post N°#{n} Hella beard selvage paleo actually Intelligentsia, craft beer plaid bicycle rights irony 3 wolf moon brunch. Helvetica before they sold out PBR hoodie semiotics four loko direct trade synth street art",picture: File.new(Rails.root.join 'spec/images/' + "Bob_razowski-#{n}.jpg") )
end