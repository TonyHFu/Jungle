class ReviewsController < ApplicationController
	def create
		@product = Product.find params[:product_id]
		@review = @product.review.new review_params
		@review.user = current_user

		if @review.save
			redirect_to product_path(@product)
		else
			raise 'Error saving review'
		end
	end

	private

	def review_params
		params.require(:review).permit(:rating, :body, :product_id)
	end
end
