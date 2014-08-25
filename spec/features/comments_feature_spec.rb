require 'rails_helper'

describe 'COMMENTS' do
	
	context 'when logged in' do
		before(:each) do
			alex = User.create(
				 email: "a@a.com",
				 password: "123456789",
				 password_confirmation: "123456789")
			login_as("a@a.com", "123456789")
			Post.create(title: "bob")
		end

		it 'can let a comment' do
			visit('/')
			fill_in 'comment_comment', with: "commentaa"
			click_button 'Submit comment'
			expect(page).to have_content("commentaa")
		end

	end
	
end