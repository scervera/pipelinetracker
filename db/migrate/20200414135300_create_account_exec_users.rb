class CreateAccountExecUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :account_exec_users do |t|

      t.timestamps
    end
  end
end
