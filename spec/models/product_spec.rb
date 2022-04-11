require 'rails_helper'

RSpec.describe Product, type: :model do
	it 'saves if no validation fails' do
		@category = Category.new(name: 'pets')
		@category.save!
		@product =
			Product.new(
				name: 'dog',
				description: "it's a dog",
				category: @category,
				quantity: 15,
				price: 1500,
			)
		@product.save!
		# p Product.all
	end
	it 'validates name is present' do
		@category = Category.new(name: 'pets')
		@category.save!
		@product =
			Product.new(
				name: nil,
				description: "it's a dog",
				category: @category,
				quantity: 15,
				price: 1500,
			)
		@product.save
		expect(@product.errors.full_messages).to include "Name can't be blank"
	end
	it 'validates price is present' do
		@category = Category.new(name: 'pets')
		@category.save!
		@product =
			Product.new(
				name: 'doge',
				description: "it's a dog",
				category: @category,
				quantity: 15,
			)
		@product.save
		expect(@product.errors.full_messages).to include "Price can't be blank"
	end
	it 'validates quantity is present' do
		@category = Category.new(name: 'pets')
		@category.save!
		@product =
			Product.new(
				name: 'doge',
				description: "it's a dog",
				category: @category,
				quantity: nil,
				price: 1500,
			)
		@product.save
		expect(@product.errors.full_messages).to include "Quantity can't be blank"
	end
	it 'validates category is present' do
		@category = Category.new(name: 'pets')
		@category.save!
		@product =
			Product.new(
				name: 'doge',
				description: "it's a dog",
				category: @nil,
				quantity: 15,
				price: 1500,
			)
		@product.save
		expect(@product.errors.full_messages).to include "Category can't be blank"
	end
end
