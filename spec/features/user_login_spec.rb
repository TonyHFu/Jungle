require 'rails_helper'

RSpec.feature 'User logs in', type: :feature, js: true do
	#SETUP
	before :each do
		@user =
			User.create!(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: '123456',
			)
	end

	scenario 'User logs in' do
		# ACT
		visit login_path

		# DEBUG
		save_screenshot

		# VERIFY
		expect(page.has_content?('Login')).to be true

		# ACT
		fill_in 'email', with: 'bob@builder.com'
		fill_in 'password', with: '123456'

		click_on 'Submit'

		# DEBUG
		save_screenshot

		# VERIFY
		expect(page.has_content?('bob')).to be true
		expect(page.has_content?('Logout')).to be true
	end
end
