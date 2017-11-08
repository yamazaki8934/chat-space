class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
