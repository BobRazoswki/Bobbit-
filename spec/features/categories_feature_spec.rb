require 'rails_helper'
# prefer_exact
describe 'CATEGORIES' do
	
	context 'hot' do
		it 'displays the hottest post' do
				

				alex = User.create(
					email: "a@a.fr",
					password: "123456789",
					password_confirmation: "123456789")
				login_as("a@a.fr", "123456789")

			visit posts_hot_path
			expect(page).to have_content('Hooot')
		end
	end

end