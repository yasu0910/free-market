class DeliveryInfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_hurigana, :last_name_hurigana, :postal_code, :state, :city, :street, :building_name, :room_number, :phone_number ,presence: true
end
