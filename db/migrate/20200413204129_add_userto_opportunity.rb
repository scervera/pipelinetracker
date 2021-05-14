class AddUsertoOpportunity < ActiveRecord::Migration[5.2]
  def change
  	add_reference :opportunities, :user, foreign_key: true
  end
end
