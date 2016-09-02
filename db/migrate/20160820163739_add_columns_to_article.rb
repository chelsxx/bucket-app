class AddColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :date, :date
    add_column :articles, :place, :string
    add_column :articles, :category, :string
  end
end
