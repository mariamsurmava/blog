# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :role, :integer
  end
end
