class CreateAppleCares < ActiveRecord::Migration[5.2]
  def change
    create_table :apple_cares do |t|
      t.text :product

      t.timestamps
    end
  end
end
