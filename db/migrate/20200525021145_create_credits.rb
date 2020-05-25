class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      # 外部キーのため後から実装します
      # t.references :user, foreign_key: true
      t.integer :number, null: false
      t.date :expiration_date, null: false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end
