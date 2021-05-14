class CreateSalesStages < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_stages do |t|
      t.string :stage

      t.timestamps
    end
  end
end
