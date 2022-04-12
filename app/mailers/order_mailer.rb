class OrderMailer < ApplicationMailer
	default from: 'reply@jungle.com'

	def order_confirmation(user, order)
		@user = user
		@order = order
		mail(to: user.email, subject: "Order Confirmation - #{order.id}")
	end
end
