require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should have a password and password_confirmation' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: nil,
			)
		@user.save!
		p User.all
	end
	it 'should have a password and password_confirmation that match' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: '456',
			)
		@user.save!
		p User.all
	end
end
