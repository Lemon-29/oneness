FactoryBot.define do
  factory :post do
    content { "Post1" }
    image { File.open("./app/assets/images/pose1-1.jpg") }
    # user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
  end
  factory :post2, class: "Post" do
    content { "Post2" }
    image { File.open("./app/assets/images/pose1-2.jpg") }
  end

  factory :post3, class: "Post" do
    content { "Post3" }
    image { File.open("./app/assets/images/pose2-1.jpg") }
  end

end
