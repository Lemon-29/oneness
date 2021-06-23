FactoryBot.define do
  factory :post do
    content { "Post1" }
    image { File.open("./app/assets/images/pose1-1.jpg") }
    user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
  end
  factory :post2, class: "Post" do
    content { "Post2" }
    image { File.open("./app/assets/images/pose1-2.jpg") }
    user_id { (User.find_by(email: FactoryBot.build(:admin_user).email) || FactoryBot.create(:admin_user)).id }
  end
end
