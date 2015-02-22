class User < ActiveRecord::Base
	before_save { self.email = email.downcase } #This is a callback, because some db indexes make a difference between 
												#upper and donw case and we want all of them to be the same
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#remember, parenthesis are optional
	validates(:email, { presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: false }})
	has_secure_password
	validates :password, length: { minimum: 6 }
end
