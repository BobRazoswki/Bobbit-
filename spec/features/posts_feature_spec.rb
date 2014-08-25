require 'rails_helper'

describe 'POSTS' do

	context 'when no posts' do

		it 'displays a error message' do
			visit('/')
			expect(page).to have_content("No bob's yet")
		end

	end

	describe 'can create an post' do

		context 'if logged out' do
			it 'do not allow to use post form' do
				visit('/')
				fill_in 'post_title', with: "Super title"
				fill_in 'post_content', with: "Awesome content"
				click_button 'Submit post'
				expect(current_path).to eq('/users/sign_in')
			end
		end

		context 'if logged in' do

			it 'allow to use the article form' do

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
				fill_in 'post_title', with: "Super title"
				fill_in 'post_content', with: "Awesome content"
				click_button 'Submit post'
				expect(page).to have_content("Super title")
			end

			it 'can add a picture' do

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
				fill_in 'post_title', with: "Super title"
				fill_in 'post_content', with: "Awesome content"
				attach_file 'post_picture', Rails.root.join('spec/images/Bob_razowski-1.jpg')
				click_button 'Submit post'
				expect(page).to have_content("Super title")
			end
		end
		end
end