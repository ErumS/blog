class AddNameToArticle < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :name, :text
  end
end
