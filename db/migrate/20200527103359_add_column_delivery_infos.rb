class AddColumnDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_infos, :first_name, :string, null: false

    add_column :delivery_infos, :last_name, :string, null: false

    add_column :delivery_infos, :first_name_hurigana, :string, null: false

    add_column :delivery_infos, :last_name_hurigana, :string, null: false

    add_column :delivery_infos, :postal_code, :integer, null: false

    add_column :delivery_infos, :state, :string, null: false

    add_column :delivery_infos, :city, :string, null: false

    add_column :delivery_infos, :street, :string, null: false

    add_column :delivery_infos, :building_name, :string, null: false

    add_column :delivery_infos, :room_number, :string

    add_column :delivery_infos, :phone_number, :integer
  end
end
