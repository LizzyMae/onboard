class User < ActiveRecord::Base
	
	#associations

	#validations
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	
	#plugins
	has_secure_password
	
	#everything else
end
