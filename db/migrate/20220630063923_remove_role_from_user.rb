class RemoveRoleFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_id, :bigint
  end
end
