# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Admin",
             email: "admin@fts38.com",
             password:              "12345678",
             password_confirmation: "12345678",
             role: 1)
User.create!(name:  "User",
             email: "example@fts38.com",
             password:              "12345678",
             password_confirmation: "12345678",
             role: 0)

5.times do
  name = Faker::Lorem.words(2).join(' ')
  Category.create!(name: name, description: name)
end

categories = Category.all
categories.each do |category|
  20.times do
    content = Faker::Lorem.word
    category.questions.create!(content: content)
  end
end

questions = Question.all
questions.each do |question|
  content = Faker::Lorem.words(2).join(' ')
  question.answers.create!(content: content, correct: true)
  3.times do
    content = Faker::Lorem.words(2).join(' ')
    question.answers.create!(content: content, correct: false)
  end
end
