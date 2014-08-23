require 'rails_helper'

describe 'DISLIKES' do

	context "while logged out" do

		before(:each) do
			Post.create(title: "bob")
		end

		it "a user can like" do
			visit('/')
			click_link 'Dislike'
			expect(current_path).to eq('/users/sign_up')
		end

	end

	context "while logged in" do

		before(:each) do
			alex = User.create(
				 email: "a@a.com",
				 password: "123456789",
				 password_confirmation: "123456789")
			login_as("a@a.com", "123456789")
			Post.create(title: "bob")
		end

		xit "a user can like" do
			visit('/')
			click_link 'Dislike'
			expect(Dislike.count).to eq 1
		end
	end

end