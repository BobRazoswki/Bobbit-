require 'rails_helper'

describe 'STRIPE' do

	context "while logged out" do

		it "a visitor can not buy" do

			Post.create(title: "bob", amount: "2000")

			visit('/')
			expect(page).to have_css('label.amount')
			expect(current_path).to eq('/')
		end

	end

	context "while logged in" do

		it "a user can buy the full post" do

			alex = User.create(
				email: "a@a.fr",
				password: "123456789",
				password_confirmation: "123456789")
			login_as("a@a.fr", "123456789")

			Post.create(title: "bob", amount: "2000")

			visit('/')
			expect(page).to have_css('label.amount')
			expect(current_path).to eq('/')
		end
	end

end