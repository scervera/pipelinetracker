class AddRoleAndCarrierToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_column :users, :carrier, :string
  end
end
