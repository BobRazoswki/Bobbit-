require 'rails_helper'

describe 'LIKES' do

	context "while logged out" do

		before(:each) do
			Post.create(title: "bob")
		end

		it "a user cannot like", js: true do
			visit('/')
			click_link 'Like it!'
			expect(current_path).to eq('/')
		end

	end

	context "while logged in" do

		it "a user can like", js: true do

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			Post.create(title: "bob")

			visit('/')
			#find('.dislike-link').click
			click_link "Like it!"
			expect(page).to have_content"1 Like"
		end

	end

end