class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :category
      t.string :model
      t.integer :storage
      t.string :color
      t.references :opportunity, foreign_key: true

      t.timestamps
    end
  end
end
