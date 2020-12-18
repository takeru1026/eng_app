class AddColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :price, :string
    add_column :articles, :language, :string
    add_column :articles, :period, :string
    add_column :articles, :country, :string
  end
end
