class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :interpretations
  has_many :users, through: :interpretations
end
