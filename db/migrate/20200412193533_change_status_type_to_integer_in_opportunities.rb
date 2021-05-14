class ChangeStatusTypeToIntegerInOpportunities < ActiveRecord::Migration[5.2]
  def change
  	change_column :opportunities, :stage, :integer, default: 0
  end
end
