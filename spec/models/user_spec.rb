require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should have a password' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@builder.com',
				password: nil,
				password_confirmation: nil,
			)
		@user.save
		expect(@user.errors.full_messages).to include "Password can't be blank"
	end
	it 'should have a password_confirmation' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: nil,
			)
		@user.save
		expect(
			@user.errors.full_messages,
		).to include "Password confirmation can't be blank"
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
		@user.save
		expect(
			@user.errors.full_messages,
		).to include "Password confirmation doesn't match Password"
	end
end
