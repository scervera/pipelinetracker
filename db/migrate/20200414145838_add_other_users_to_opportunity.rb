class AddOtherUsersToOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_reference :opportunities, :account_exec_user, foreign_key: true
    add_reference :opportunities, :sys_engineer_user, foreign_key: true
  end
end
