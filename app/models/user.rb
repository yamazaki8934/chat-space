class User < ApplicationRecord
  has_many :groups, through: :members
  has_many :members
  has_many :messages
  validates :email, :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :search_users, lambda { |keyword|
      where('name LIKE(?)', "%#{keyword}%")
    }
end
