class RenameContentColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :credit_id, :card_id
  end
end
