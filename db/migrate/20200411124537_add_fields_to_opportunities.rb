class AddFieldsToOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :product, :string
    add_column :opportunities, :sales_stage, :string
    add_column :opportunities, :purchase_method, :string
    add_column :opportunities, :forecast_this_quarter, :integer
    add_column :opportunities, :close_date, :date
    add_column :opportunities, :use_case, :text
    add_column :opportunities, :industry, :string
    add_column :opportunities, :segment, :string
    add_column :opportunities, :source, :string
    add_column :opportunities, :usma_owned, :boolean
    add_column :opportunities, :notes, :text
    add_column :opportunities, :earnings_nomination, :boolean
  end
end
