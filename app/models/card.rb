class Card < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :month
  validates :card_id, :customer_id, presence: true
end
