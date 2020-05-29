class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_hurigana, :last_name_hurigana, :birthday ,presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, length: { minimum: 7 }
  has_one :delivery_info
end

