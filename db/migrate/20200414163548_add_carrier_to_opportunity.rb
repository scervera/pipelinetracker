class AddCarrierToOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :carrier, :string
  end
end
