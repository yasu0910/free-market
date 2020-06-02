class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  validates :name, :category_id, :content, :status, :postage, :prefecture_id, :shipping_days, :price ,presence: true
  validates :images,presence: true
  belongs_to :user
end
