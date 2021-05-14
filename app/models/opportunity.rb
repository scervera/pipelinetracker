class Opportunity < ApplicationRecord
	include Filterable
	belongs_to :product
	accepts_nested_attributes_for :product

	enum stage: { not_specified: 0, prospect_qualify: 1, propose: 2, negotiate: 3, shipped: 4, lost: 5 }

	belongs_to :account_exec_user
	belongs_to :sys_engineer_user
	has_many :comments, inverse_of: :opportunity
	accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
	
    has_many :support_opportunities
	has_many :apple_cares, through: :support_opportunities
    accepts_nested_attributes_for :apple_cares

    scope :filter_by_stage, -> (stage) { where stage: stage }
    scope :filter_by_carrier, -> (carrier) { where carrier: carrier }
    scope :filter_by_quantity_gte, -> (quantity) { where('quantity >= ?', quantity) }
    scope :filter_by_quantity_lte, -> (quantity) { where('quantity <= ?', quantity) }
    scope :filter_by_user_with_name_like, -> (name) { where("account_exec_user_id LIKE ? or sys_engineer_user_id LIKE ?", name, name ) }
    scope :filter_by_created_before, -> (created_at) { where('created_at < ?', created_at.to_date ) }    
    scope :filter_by_created_after, -> (created_at) { where('created_at > ?', created_at.to_date ) }
    scope :filter_by_updated_before, -> (updated_at) { where('updated_at < ?', updated_at.to_date ) }    
    scope :filter_by_updated_after, -> (updated_at) { where('updated_at > ?', updated_at.to_date ) }

    scope :count_all_shipped, -> { Opportunity.all.where( stage: "shipped").size }
    scope :count_all_lost, -> { Opportunity.all.where( stage: "lost").size }
    scope :count_all_negotiate, -> { Opportunity.all.where( stage: "negotiate").size }
end
