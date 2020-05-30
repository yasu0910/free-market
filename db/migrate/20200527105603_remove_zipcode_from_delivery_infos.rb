class RemoveZipcodeFromDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_infos, :zipcode, :integer
  end
end
