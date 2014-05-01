class Room < ActiveRecord::Base

	#associations 

	#validations 
	validates :name, presence: true
	validates :address, presence: true
	validates :number_of_guests, presence: true, numericality: { greater_than: 0 }

	#plugins
	geocoded_by :address
	after_validation :geocode 

	#anything else
end
