require 'rails_helper'

describe 'COMMENTS' do

	context 'when logged in' do

		it 'can let a comment' do

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
