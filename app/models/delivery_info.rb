class DeliveryInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_hurigana, :last_name_hurigana, :postal_code, :prefecture_id, :city, :street ,presence: true
end
