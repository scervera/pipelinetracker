class AddAssociationsToSupportOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_reference :support_opportunities, :apple_care, foreign_key: true
    add_reference :support_opportunities, :opportunity, foreign_key: true
    add_column :support_opportunities, :fiscal_year, :date
    add_column :support_opportunities, :fiscal_quarter, :string
  end
end
