class CreateOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :opportunities do |t|
      t.string :customer_name
      t.string :stage
      t.integer :quantity

      t.timestamps
    end
  end
end
