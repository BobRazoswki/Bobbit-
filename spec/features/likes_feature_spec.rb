require 'rails_helper'

describe 'LIKES' do
	context "while logged in" do

	before(:each) do
		alex = User.create(
			 email: "a@a.com",
			 password: "123456789",
			 password_confirmation: "123456789")
		login_as("a@a.com", "123456789")
		Post.create(title: "bob")
	end

		it "a user can like" do
			visit('/')
			click_link 'Like it!'
			expect(Like.count).to eq 1
		end
	end


end