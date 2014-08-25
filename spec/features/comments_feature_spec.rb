require 'rails_helper'

describe 'COMMENTS' do
	
	context 'when logged in' do
		before(:each) do
			user = FactoryGirl.create(:user) 
			post = FactoryGirl.create(:post)
		end

		it 'can let a comment' do
			visit('/')
			fill_in 'comment_comment', with: "commentaa"
			click_button 'Submit comment'
			save_and_open_page
			expect(page).to have_content("commentaa")

		end

	end
	
end