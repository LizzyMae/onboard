class Room < ActiveRecord::Base

	#associations 
	belongs_to :user
	has_many :orders

	#validations 
	validates :name, presence: true
	validates :address, presence: true
	validates :number_of_guests, presence: true, numericality: { greater_than: 0 }
	validates :price_in_pence, presence: true, numericality: { greater_than_or_equal_to: 50 }


	#plugins
	geocoded_by :address
	after_validation :geocode 

	#paper clip #wil crop the image to 950x400 or 500x makes the image wide 500 or vs
	has_attached_file :image, styles: { large: "960x400#", medium: "320x200#", thumbnail: "60x60#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	#anything else
end
