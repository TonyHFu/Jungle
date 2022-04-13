class ReviewsController < ApplicationController
	before_filter :require_login

	def create
		@product = Product.find params[:product_id]
		@review = @product.review.new review_params
		@review.user = current_user

		if @review.save
			redirect_to product_path(@product)
		else
			redirect_to product_path(@product), notice: 'Error saving review'
		end
	end

	def destroy
		@review = Review.find params[:id]
		@product = @review.product
		@review.destroy
		redirect_to product_path(@product), notice: 'Review deleted!'
	end

	private

	def review_params
		params.require(:review).permit(:rating, :body, :product_id)
	end

	def require_login
		redirect_to login_path, notice: 'You must be logged in' unless current_user
	end
end
