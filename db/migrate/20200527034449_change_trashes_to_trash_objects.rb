class ChangeTrashesToTrashObjects < ActiveRecord::Migration[5.2]
  def change
    rename_table :credits, :cards
  end
end
