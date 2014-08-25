require 'rails_helper'

describe 'DISLIKES' do

	context "while logged out" do

		xit "a user cannot dislike" do

			Post.create(title: "bob")

			visit('/')
			save_and_open_page
			click_link 'Dislike'
			expect(current_path).to eq('/users/sign_up')
		end

	end

	context "while logged in" do

		xit "a user can dislike" do

			def login_as(email, password)
				visit('/users/sign_in')
				fill_in 'user_email', with: email
				fill_in 'user_password', with: password
				click_button 'Sign in'
			end

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			visit('/')
			click_link 'Dislike'
			expect(Dislike.count).to eq 1
		end
	end

end