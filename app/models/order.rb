class Order < ActiveRecord::Base



	# associations
	belongs_to :room
	belongs_to :user
	
	# validations
	#plugins
	#everything else

end
