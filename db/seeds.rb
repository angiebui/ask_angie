# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([
  {username: "Angie", password: "password", email: "angie@gmail.com", gender: "female"}, 
  {username: "Sean", password: "password", email: "sean@gmail.com", gender: "male"},
  ])


answers = Answer.create([
  {question_id: 1, user_id: 1, body: "I think it's a jewelry"}, 
  {question_id: 1, user_id: 2, body: "It's definitely a girl's name"},
  {question_id: 2, user_id: 3, body: "Chicago"}, 
  ])


questions = Question.create([
  {user_id: 1, title: "A question about Ruby", body: "What is Ruby?"}, 
  {user_id: 2, title: "Texting Girls", body: "What does she mean by 'hi' ?"},
  ])
