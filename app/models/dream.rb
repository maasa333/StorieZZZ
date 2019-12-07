class Dream < ApplicationRecord
  belongs_to :user
  has_many :interpretations
  has_many :users, through: :interpretations
end
