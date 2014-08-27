require 'rails_helper'

describe 'DISLIKES' do

	context "while logged out" do

	it "a user cannot dislike", js: true do

			Post.create(title: "bob")

			visit('/')
			click_link 'Dislike'
			expect(current_path).to eq('/')
		end

	end

	context "while logged in" do

		it "a user can dislike", js: true do

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			Post.create(title: "bob")

			visit('/')
			#find('.dislike-link').click
			click_link "Dislike"
			expect(page).to have_content"1 Dislike"
		end
	end

end