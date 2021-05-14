class RemoveOpportunityIdFromProducts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products, :opportunity_id
  	#remove_index :opportunity_id, name: "index_completions_on_survey_id_and_user_id"
  end
end
