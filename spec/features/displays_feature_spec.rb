require 'rails_helper'

describe 'DISPLAYS' do

	context 'Hot' do
		it 'display the hottest posts' do

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
			click_link('Hot')
			expect(page).to have_content('Hooot')
		end
	end
end