class AddPrefectureIdToAddColumnDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_infos, :prefecture_id, :integer, null: false
  end
end
