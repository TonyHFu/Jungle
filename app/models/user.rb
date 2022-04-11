class User < ActiveRecord::Base
	has_secure_password
	validates :password, length: { minimum: 5 }
	validates :password_confirmation, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :first_name, presence: true
	validates :last_name, presence: true

	def self.authenticate_with_credentials(email, password)
		user = User.find_by_email(email.strip)
		return user if user && user.authenticate(password)
		nil
	end
end
