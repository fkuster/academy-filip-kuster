# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#hash=BCrypt::Password.create("fkuster123")

User.create(email:"fkuster@foi.hr",nickname:"fkuster",password:"fkuster123")
