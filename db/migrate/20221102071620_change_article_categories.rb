class ChangeArticleCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :article_categories, :user_id, :category_id
  end
end
