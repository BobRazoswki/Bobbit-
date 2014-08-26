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

		before(:each) do
				alex = User.create(
					email: "a@a.fr",
					password: "123456789",
					password_confirmation: "123456789")
				login_as("a@a.fr", "123456789")
		end

		it "a user can buy the full post" do
			Post.create(title: "bob", amount: "2000")
			visit('/')
			expect(page).to have_css('label.amount')
			expect(current_path).to eq('/')
		end

		it "a user can buy the full post", js: true do
			Post.create(title: "bob", amount: "2000")
			visit('/')
			find('.stripe-button-el').click
  		Capybara.within_frame 'stripe_checkout_app' do
				fill_in "email", with: "a@a.fr"
				fill_in "card_number", with: "4242424242424242"
				fill_in "cc-exp", with: "09/16"
				fill_in "cc-csc", with: "234"
				find('#submitButton').click
			end
			expect(current_path).to eq root_path
		end


	end

end