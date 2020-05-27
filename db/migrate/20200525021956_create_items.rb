class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      # 外部キーの為、後で追加
      # t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :content, null: false
      t.string :brand
      t.integer :status, null: false
      t.integer :postage, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_days, null: false
      t.integer :price, null: false

      # 外部キーの為、後で追加
      # t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
