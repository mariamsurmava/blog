class AddConfirmationSentToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmation_sent_at, :string
    add_column :users, :uconfirmed_email, :string
  end
end


