class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_hurigana, :last_name_hurigana, :birthday ,presence: true
  has_one :delivery_info
  has_one :card, dependent: :destroy
  has_many :items, dependent: :destroy
end

