# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.find_by(
  email: "lisa@gmail.com"
) || User.create!(
  name: "lisa",
  email: "lisa@gmail.com",
  password: "lisa0106",
  admin: true,
)

# MEMO: I'll customize on my own later :)
# post1_2 = Post.create!(
#   title: "ゆっくりしませんか？",
#   content: "動物たちが可愛い！！！",
#   address: "熊本県阿蘇郡西原村",
#   image: File.open("app/assets/images/spot-kumamoto-kumamoto_12.jpeg"),
#   user_id: user1.id,
# )
