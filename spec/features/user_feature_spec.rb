require 'rails_helper'

describe 'USERS' do 

	context 'can sign in,' do

		xit 'on the homepage' do
			#need to know how to test modals
		end

		it 'on users/sign_in' do

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
			
			expect(current_path).to eq ('/')

		end

	end

end