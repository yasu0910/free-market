class Credit < ApplicationRecord
  belongs_to :user

  validates :content__title__name, presence: true, length: { in: 3..4 }
end
