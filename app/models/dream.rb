class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :interpretations
  has_many :users, through: :interpretations
  validates :description, presence: true, length: { maximum: 500 }
  validates :date, presence: true
end
