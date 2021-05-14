class AddTrackingToOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :tracking, :boolean
  end
end
