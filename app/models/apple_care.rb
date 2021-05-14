class AppleCare < ApplicationRecord
	has_many :support_opportunities
	has_many :opportunities, through: :support_opportunities

	scope :applecare_by_id, -> { order(id: :asc) }
end
