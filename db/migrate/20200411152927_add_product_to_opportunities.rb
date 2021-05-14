class AddProductToOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_reference :opportunities, :product, foreign_key: true
  end
end
