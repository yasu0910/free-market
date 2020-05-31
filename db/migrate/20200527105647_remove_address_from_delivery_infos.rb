class RemoveAddressFromDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_infos, :address, :integer
  end
end
