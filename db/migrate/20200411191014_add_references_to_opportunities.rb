class AddReferencesToOpportunities < ActiveRecord::Migration[5.2]
  def change
  	add_reference :opportunities, :account_executive, foreign_key: true
  	add_reference :opportunities, :engineer, foreign_key: true
  end
end
