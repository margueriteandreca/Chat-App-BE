# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



u1 = User.create!(first_name: "Jimmy", last_name: "Yang", username: "itzjimmyO", password: "aylmao123", status: "Just a boy doing racist accents")
u2 = User.create!(first_name: "Alan", last_name: "Xu", username: "kojisdad", password: "iloveamy69", status: "Shiba dad")
u3 = User.create!(first_name: "Marguerite", last_name: "Andreca", username: "romaniangoddess", password: "sushi420", status: "Alan's mom")
u4 = User.create!(first_name: "Chett", last_name: "Tiller", username: "brewchetta", password: "vegansushi123", status: "Leave me alone please")
u5 = User.create!(first_name: "Kai", last_name: "Lin", username: "kaisthesmartest", password: "homework456", status: "FREAKING OUT")

c1 = Conversation.create!(name: "Our Chat")
c2 = Conversation.create!(name: "Koji's Chat")
c3 = Conversation.create!(name: "Flatiron Chat")




m1 = Message.create!(message_content: "I miss Amy sooooo much", user: u2, conversation: c1)
m2 = Message.create!(message_content: "Get over her", user: u3, conversation: c1)
m3 = Message.create!(message_content: "Tony I need help", user: u2, conversation: c3)
m4 = Message.create!(message_content: "I miss Amy sooooo much", user: u2, conversation: c2)


