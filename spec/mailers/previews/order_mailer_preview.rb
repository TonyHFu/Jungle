# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
	def order_confirmation
		OrderMailer.order_confirmation(User.first, Order.first)
	end
end
