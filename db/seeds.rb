# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.find_by(
  email: "admin@gmail.com"
) || User.create!(
  name: "admin",
  email: "admin@gmail.com",
  password: "admin1234",
  admin: true,
  image: File.open("admin.jpg"),
)

user2 = User.find_by(
  email: "saaya@gmail.com"
) || User.create!(
  name: "saaya",
  email: "saaya@gmail.com",
  password: "saaya1234",
  image: File.open("saaya.jpg"),
)

user3 = User.find_by(
  email: "may@gmail.com"
) || User.create!(
  name: "may",
  email: "may@gmail.com",
  password: "may1234",
  image: File.open("may.jpg"),
)

user4 = User.find_by(
  email: "juri@gmail.com"
) || User.create!(
  name: "juri",
  email: "juri@gmail.com",
  password: "juri1234",
  image: File.open("juri.jpg"),
)


user5 = User.find_by(
  email: "lisa@gmail.com"
) || User.create!(
  name: "lisa",
  email: "lisa@gmail.com",
  password: "lisa1234",
  image: File.open("lisa.jpg"),
)

#------------

post1_1 = Post.create!(
  content: "morning yoga w/sunrise. feels so good!",
  image: File.open("pose1-1.jpg"),
  user_id: user1.id,
)
post1_2 = Post.create!(
  content: "fucus on just one point",
  image: File.open("pose1-2.jpg"),
  user_id: user1.id,
)

post2_1 = Post.create!(
  content: "so much relaxing",
  image: File.open("pose3-1.jpg"),
  user_id: user3.id,
)
post2_2 = Post.create!(
  content: "what a beautiful day",
  image: File.open("pose3-2.jpg"),
  user_id: user3.id,
)
post3_1 = Post.create!(
  content: "omg i love my shadow. so beautiful isn't it?",
  image: File.open("pose4-1.jpg"),
  user_id: user4.id,
)
post3_2 = Post.create!(
  content: "love doing yoga at beach",
  image: File.open("pose4-2.jpg"),
  user_id: user4.id,
)
post4_1 = Post.create!(
  content: "flying Pigeon. finally i did it!",
  image: File.open("pose4-1.jpg"),
  user_id: user4.id,
)
post4_2 = Post.create!(
  content: "look at the sky. let's do yoga.",
  image: File.open("pose4-2.jpg"),
  user_id: user4.id,
)
post5_1 = Post.create!(
  content: "can you find the cressent moon over me?",
  image: File.open("pose5-1.jpg"),
  user_id: user5.id,
)
post5-2 = Post.create!(
  content: "headstand. I've been paracticed every single day",
  image: File.open("pose5-2.jpg"),
  user_id: user5.id,
)

#memo favorites i'll do it later