require 'rails_helper'

RSpec.feature 'Adds product to cart', type: :feature, js: true do
	#SETUP
	before :each do
		@category = Category.create! name: 'Apparel'

		10.times do |n|
			@category.products.create!(
				name: Faker::Hipster.sentence(3),
				description: Faker::Hipster.paragraph(4),
				image: open_asset('apparel1.jpg'),
				quantity: 10,
				price: 64.99,
			)
		end
	end

	scenario 'Adds product to cart' do
		# ACT
		visit root_path

		# DEBUG
		save_screenshot

		# VERIFY
		expect(page).to have_css 'article.product', count: 10
		expect(page.has_content?('My Cart (0)')).to be true

		# ACT
		find('.product footer form', match: :first).click

		# DEBUG
		save_screenshot

		# VERIFY
		expect(page.has_content?('My Cart (1)')).to be true
	end
end
