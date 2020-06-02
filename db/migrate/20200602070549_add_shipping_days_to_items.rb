class AddShippingDaysToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_days, :string, null: false
  end
end
