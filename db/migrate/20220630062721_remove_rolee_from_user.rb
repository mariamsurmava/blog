# frozen_string_literal: true

class RemoveRoleeFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :integer
  end
end
