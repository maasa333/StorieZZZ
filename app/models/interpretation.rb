class Interpretation < ApplicationRecord
  belongs_to :dream
  belongs_to :user
  validates :description, presence: true, length: { maximum: 500 }
end
