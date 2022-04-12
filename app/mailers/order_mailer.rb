class OrderMailer < ApplicationMailer
	default from: 'reply@jungle.com'

	def order_confirmation(user)
		@user = user
		mail(to: user.email, subject: 'Order Confirmation')
	end
end
