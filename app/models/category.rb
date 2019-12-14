class Category < ApplicationRecord
    has_many :dreams

    def self.alpha
        order(:name)
    end
end
