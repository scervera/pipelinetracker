class AddSalesStageToOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_reference :opportunities, :sales_stage, foreign_key: true
  end
end
