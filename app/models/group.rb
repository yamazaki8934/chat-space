class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  has_many :messages
  validates :name, presence: true
  accepts_nested_attributes_for :members
end
