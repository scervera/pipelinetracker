class CreateAccountExecutives < ActiveRecord::Migration[5.2]
  def change
    create_table :account_executives do |t|
      t.string :firstname
      t.string :lastname
      t.string :carrier

      t.timestamps
    end
  end
end
