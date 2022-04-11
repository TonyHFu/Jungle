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

	it 'should have unique emails' do
		@user_1 =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'bob@BUILDER.com',
				password: '123456',
				password_confirmation: '123456',
			)
		@user_1.save!

		@user_2 =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: 'BOB@builder.com',
				password: '123456',
				password_confirmation: '123456',
			)
		@user_2.save
		expect(
			@user_2.errors.full_messages,
		).to include 'Email has already been taken'
	end

	it 'should have an email' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: 'builder',
				email: nil,
				password: '123456',
				password_confirmation: '123456',
			)
		@user.save
		expect(@user.errors.full_messages).to include "Email can't be blank"
	end

	it 'should have a first name' do
		@user =
			User.new(
				first_name: nil,
				last_name: 'builder',
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: '123456',
			)
		@user.save
		expect(@user.errors.full_messages).to include "First name can't be blank"
	end
	it 'should have a last name' do
		@user =
			User.new(
				first_name: 'bob',
				last_name: nil,
				email: 'bob@builder.com',
				password: '123456',
				password_confirmation: '123456',
			)
		@user.save
		expect(@user.errors.full_messages).to include "Last name can't be blank"
	end
end
