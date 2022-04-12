require 'rails_helper'

RSpec.feature 'Navigates to product details page', type: :feature, js: true do
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

	scenario 'Visitor navigates from home page to product details page' do
		# ACT
		visit root_path

		# VERIFY
		expect(page).to have_css 'article.product', count: 10

		# ACT
		find('.product a', match: :first).click

		# VERIFY
		expect(page).to have_css '.product-detail', count: 1

		# DEBUG
		# For some weird reason, if save_screenshot before Verify in this case, screenshots old products page
		save_screenshot
	end
end
