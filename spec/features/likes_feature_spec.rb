require 'rails_helper'

describe 'LIKES' do

	context "while logged out" do

		before(:each) do
			Post.create(title: "bob")
		end

		xit "a user cannot like" do
			visit('/')
			click_link 'Like it!'
			expect(current_path).to eq('/users/sign_up')
		end

	end

	context "while logged in" do

		xit "a user can like" do

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			visit('/')
			click_link 'Like it!'
			expect(Like.count).to eq 1
		end

		xit 'add a like' do

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			visit('/')
			click_link "Like it!"
			#find('.like-link').click
			expect(page).to have_content '1 Like'
		end

	end

end