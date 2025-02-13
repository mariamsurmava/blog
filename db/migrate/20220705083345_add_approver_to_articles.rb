# frozen_string_literal: true

class AddApproverToArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :article_approve do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
