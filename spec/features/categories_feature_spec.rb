require 'rails_helper'

describe 'CATEGORIES' do
	post = FactoryGirl.create(:post)
	it 'hot' do
		visit posts_hot_path
		expect(page).to have_content('Hooot')
	end
end