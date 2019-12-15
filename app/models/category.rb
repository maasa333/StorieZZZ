class Category < ApplicationRecord
    has_many :dreams

    scope :by_funny, -> { where(name: 'Funny') }

    def self.alpha
        order(:name)
    end
end
