require 'rails_helper'

RSpec.describe Post, :type => :model do
=begin
  xit 'if name < 5 character' do
		post = Post.new(title: "Bob", content: 'contentaaa')
		expect(post).to have(1).error_on(:title)
	end

	xit 'if does not start with an uppercase' do
		post = Post.new(title: "bobbbbbbbbb")
		expect(post).to have(1).error_on(:title)
	end
	
	xit 'if does not uniq' do
		Post.create(title: "bobbbbbbbbb")
		post = Post.new(title: "bobbbbbbbbb")
		expect(post).to have(1).error_on(:title)
	end
=end
end
