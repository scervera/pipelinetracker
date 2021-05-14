class CreateSalesLeadUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_lead_users do |t|

      t.timestamps
    end
  end
end
