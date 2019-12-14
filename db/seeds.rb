# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users
goku = User.create(username: "Goku", email: "goku@mail.com", password: "iamgoku")
ranma = User.create(username: "Ranma", email: "ranma@mail.com", password: "iamranma")
usagi = User.create(username: "Usagi", email: "usagi@mail.com", password: "iamusagi")
eren = User.create(username: "Eren", email: "eren@mail.com", password: "iameren")
pusheen = User.create(username: "Pusheen", email: "pusheen@mail.com", password: "iampusheen")
garfield = User.create(username: "Garfield", email: "garfield@mail.com", password: "iamgarfield")
smudege = User.create(username: "Smudge", email: "smudge@mail.com", password: "iamsmudge")

#categories
happy = Category.create(name: "Happy")
scary = Category.create(name: "Scary")
weird = Category.create(name: "Weird")
sad = Category.create(name: "Sad")
funny = Category.create(name: "Funny")
adventurous = Category.create(name: "Adventurous")
