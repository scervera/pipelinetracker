class CreateSupportOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :support_opportunities do |t|

      t.timestamps
    end
  end
end
