class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :interpretations, dependent: :destroy
  has_many :users, through: :interpretations
  
  validates :description, presence: true, length: { maximum: 500 }
  validates :date, presence: true

  def self.date_order
    order(:date).reverse_order
  end
end
