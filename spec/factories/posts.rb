FactoryBot.define do
  factory :post do
    content { "Post1" }
    image { File.open("./app/assets/images/pose1-2.jpg"), }
  end
end
