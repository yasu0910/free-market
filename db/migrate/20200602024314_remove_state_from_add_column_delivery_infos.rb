class RemoveStateFromAddColumnDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_infos, :state, :string
  end
end
