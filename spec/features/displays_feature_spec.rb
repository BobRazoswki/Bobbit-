require 'rails_helper'

describe 'DISPLAYS' do
	context 'Hot' do
		it 'display the most ranked posts' do
			visit('/')
			expect(page).to have_content
		end
	end
end