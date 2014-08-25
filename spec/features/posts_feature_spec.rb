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
		it 'do not display post form' do
			visit('/')
			fill_in 'post_title', with: "Super title"
			fill_in 'post_content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content("need")
		end
	end

	context 'if logged in' do


		let!(:user){ create(:user) }

		it 'display article form' do
			visit('/')
			fill_in 'post_title', with: "Super title"
			fill_in 'post_content', with: "Awesome content"
			click_button 'Submit post'
			expect(page).to have_content("Super title")
		end
	end

	context 'picture' do

		before(:each) do
		alex = User.create(
			 email: "a@a.com",
			 password: "123456789",
			 password_confirmation: "123456789")
		login_as("a@a.com", "123456789")

	end

		it 'can add a picture' do
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