FactoryBot.define do
  factory :post do
    content { "Post1" }
    image { File.open("./app/assets/images/pose1-1.jpg") }
    association :user, factory: :user
  end
  factory :post2 do
    content { "Post2" }
    image { File.open("./app/assets/images/pose1-2.jpg") }
    association :user, factory: :admin_user
  end
end
