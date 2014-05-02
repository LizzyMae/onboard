class User < ActiveRecord::Base
	
	#associations
	has_many :rooms
	has_many :oders

	#validations
	validates :username, presence: true, uniqueness: true, if: -> { provider.nil? } 
	validates :email, presence: true, uniqueness: true, if: -> { provider.nil? } 
	
	#plugins
	has_secure_password
	
	#everything else
end
