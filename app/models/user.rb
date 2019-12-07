class User < ApplicationRecord
    has_many :dreams
    has_many :interpretations
    has_many :interpreted_dreams, through: :interpretations, source: :dream

    has_secure_password
end
