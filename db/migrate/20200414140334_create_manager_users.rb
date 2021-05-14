class CreateManagerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_users do |t|

      t.timestamps
    end
  end
end
