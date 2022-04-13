class User < ActiveRecord::Base
	has_secure_password

	has_many :review

	validates :password, length: { minimum: 5 }
	validates :password_confirmation, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :first_name, presence: true
	validates :last_name, presence: true

	def self.authenticate_with_credentials(email, password)
		user = User.where('lower(email) = ?', email.downcase.strip).first
		return user if user && user.authenticate(password)
		nil
	end
end
