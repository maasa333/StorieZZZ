class User < ApplicationRecord
    has_many :dreams
    has_many :interpretations
    has_many :interpreted_dreams, through: :interpretations, source: :dream

    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true
end