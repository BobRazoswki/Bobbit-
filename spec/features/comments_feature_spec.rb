require 'rails_helper'

describe 'COMMENTS' do
	
	context 'when logged in' do
		
		
		it 'can let a comment' do

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
			
			Post.create(title: "bob")

			visit root_path
			fill_in 'comment_comment', with: "commentaa"
			click_button 'Submit comment'
			expect(page).to have_content("commentaa")
		end

	end
	
end