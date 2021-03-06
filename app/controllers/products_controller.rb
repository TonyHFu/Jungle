class ProductsController < ApplicationController
	def index
		@products = Product.all.order(created_at: :desc)
	end

	def show
		@product = Product.find params[:id]
		@reviews = @product.review.order(created_at: :desc)
	end
end
