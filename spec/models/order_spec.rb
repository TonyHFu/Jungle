require 'rails_helper'

RSpec.describe Order, type: :model do
	before :each do
		@category = Category.create! name: 'Apparel'

		@product1 =
			@category.products.create!(
				name: 'shirt',
				description: "it's a shirt",
				image: open_asset('apparel1.jpg'),
				quantity: 10,
				price: 20,
			)

		@product2 =
			@category.products.create!(
				name: 'pants',
				description: "it's a pair of pants",
				image: open_asset('apparel2.jpg'),
				quantity: 5,
				price: 30,
			)
	end

	it 'deduct quantity from products based on their line item quantities and do not affect others' do
		stripe_charge =
			Stripe::Charge.create(
				source: 'tok_visa',
				amount: 7000,
				description: "Khurram Virani's Jungle Order",
				currency: 'cad',
			)
		@order =
			Order.new(
				email: 'kvirani@gmail.com',
				total_cents: 7000,
				stripe_charge_id: stripe_charge.id, # returned by stripe)
			)

		@order.line_items.new(
			product: @product1,
			quantity: 2,
			item_price: @product1.price,
			total_price: @product1.price * 2,
		)

		@order.line_items.new(
			product: @product2,
			quantity: 1,
			item_price: @product2.price,
			total_price: @product2.price * 1,
		)

		@order.save!
		@order.adjust_quantity

		@product1.reload
		@product2.reload

		expect(@product1.quantity).to be 8
		expect(@product2.quantity).to be 4
	end
end
