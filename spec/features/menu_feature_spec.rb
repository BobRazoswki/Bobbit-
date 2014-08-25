require 'rails_helper'

describe 'MENU' do
	context 'if logged out' do

		it 'display sign in' do
			visit('/')
			expect(page).to have_content('Sign in')
		end

		it 'display sign up' do
			visit('/')
			expect(page).to have_content('Sign up')
		end

	end

	context 'if logged in' do
	
		it 'display sign out' do

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
			expect(page).to have_content('Sign out')
		end

	end

end