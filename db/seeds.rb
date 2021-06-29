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
  image: File.open("./app/assets/images/admin.jpg"),
)

user2 = User.find_by(
  email: "saaya@gmail.com"
) || User.create!(
  name: "saaya",
  email: "saaya@gmail.com",
  password: "saaya1234",
  image: File.open("./app/assets/images/saaya.jpg"),
)

user3 = User.find_by(
  email: "may@gmail.com"
) || User.create!(
  name: "may",
  email: "may@gmail.com",
  password: "may1234",
  image: File.open("./app/assets/images/may.jpg"),
)

user4 = User.find_by(
  email: "juri@gmail.com"
) || User.create!(
  name: "juri",
  email: "juri@gmail.com",
  password: "juri1234",
  image: File.open("./app/assets/images/juri.jpg"),
)


user5 = User.find_by(
  email: "lisa@gmail.com"
) || User.create!(
  name: "lisa",
  email: "lisa@gmail.com",
  password: "lisa1234",
  image: File.open("./app/assets/images/lisa.jpg"),
)

#------------

post1_1 = Post.create!(
  content: "morning yoga w/sunrise. feels so good!",
  image: File.open("./app/assets/images/pose1-1.jpg"),
  user_id: user1.id,
)
post1_2 = Post.create!(
  content: "fucus on just one point",
  image: File.open("./app/assets/images/pose1-2.jpg"),
  user_id: user1.id,
)

post2_1 = Post.create!(
  content: "so much relaxing",
  image: File.open("./app/assets/images/pose3-1.jpg"),
  user_id: user2.id,
)
post2_2 = Post.create!(
  content: "what a beautiful day",
  image: File.open("./app/assets/images/pose3-2.jpg"),
  user_id: user2.id,
)
post3_1 = Post.create!(
  content: "omg i love my shadow. so beautiful isn't it?",
  image: File.open("./app/assets/images/pose3-1.jpg"),
  user_id: user3.id,
)
post3_2 = Post.create!(
  content: "love doing yoga at beach",
  image: File.open("./app/assets/images/pose3-2.jpg"),
  user_id: user3.id,
)
post4_1 = Post.create!(
  content: "flying Pigeon. finally i did it!",
  image: File.open("./app/assets/images/pose4-1.jpg"),
  user_id: user4.id,
)
post4_2 = Post.create!(
  content: "look at the sky. let's do yoga.",
  image: File.open("./app/assets/images/pose4-2.jpg"),
  user_id: user4.id,
)
post5_1 = Post.create!(
  content: "can you find the cressent moon over me?",
  image: File.open("./app/assets/images/pose5-1.jpg"),
  user_id: user5.id,
)
post5_2 = Post.create!(
  content: "headstand. I've been paracticeing every single day",
  image: File.open("./app/assets/images/pose5-2.jpg"),
  user_id: user5.id,
)

#------------

favorites1_1 = Favorite.create!(
  user_id: user1.id,
  post_id: post2_1.id
)
favorites1_2 = Favorite.create!(
  user_id: user2.id,
  post_id: post4_2.id
)
favorites1_3 = Favorite.create!(
  user_id: user3.id,
  post_id: post1_2.id
)
favorites1_4 = Favorite.create!(
  user_id: user4.id,
  post_id: post5_2.id
)
favorites1_5 = Favorite.create!(
  user_id: user5.id,
  post_id: post3_2.id
)

#------------

comment1 = Comment.create!(
  user_id: user1.id,
  post_id: post4_1.id,
  content: "nice pose. i wish i could do that like u!",
  score: 5
)
comment2 = Comment.create!(
  user_id: user2.id,
  post_id: post1_1.id,
  content: "gettin better! keep trying. well done xxx",
  score: 4.5
)
comment3 = Comment.create!(
  user_id: user3.id,
  post_id: post1_2.id,
  content: "nice pose. i wish i could do that like u!",
  score: 3
)
comment4 = Comment.create!(
  user_id: user4.id,
  post_id: post1_1.id,
  content: "your pose isn't bad but the picture quality is terrible. get new one.",
  score: 2.5
)
comment5 = Comment.create!(
  user_id: user5.id,
  post_id: post2_2.id,
  content: "ummmmm,,, i don't know why u posted this one cuz u have much better than picture. why this?",
  score: 1.0
)
