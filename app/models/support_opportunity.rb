class SupportOpportunity < ApplicationRecord
	belongs_to :apple_care
	belongs_to :opportunity

	#scope :my_carrier, -> { where carrier: current_user.carrier } 

	
end
