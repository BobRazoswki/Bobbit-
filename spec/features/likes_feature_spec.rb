require 'rails_helper'

describe 'LIKES' do

	context "while logged out" do

		before(:each) do
			Post.create(title: "bob")
		end

		it "a user can like" do
			visit('/')
			click_link 'Like it!'
			expect(current_path).to eq('/users/sign_up')
		end

	end

	context "while logged in" do

		before(:each) do
			alex = User.create(
				 email: "a@a.com",
				 password: "123456789",
				 password_confirmation: "123456789")
			login_as("a@a.com", "123456789")
			Post.create(title: "bob")
		end

		xit "a user can like" do
			visit('/')
			click_link 'Like it!'
			expect(Like.count).to eq 1
		end

	it 'add a like', js: true do
		visit('/')
		click_link "Like it!"
		# find('.like-link').click
		expect(page).to have_content '1 Like'
	end

	end

end