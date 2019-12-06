# StorieZZZ App Models + Relations

## User
- has_many :dreams
- has_many :interpreted_dreams, through: :interpretations

    - username
    - email
    - password_digest

## Dream
- belongs_to :user
- has_many :users, through: :interpretations 

    - category
    - description
    - date

## Interpretation
- belongs_to :dream
- belongs_to :user

    - description 