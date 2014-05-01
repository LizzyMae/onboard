class User < ActiveRecord::Base
	
	#associations
	has_many :rooms

	#validations
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	
	#plugins
	has_secure_password
	
	#everything else
end
