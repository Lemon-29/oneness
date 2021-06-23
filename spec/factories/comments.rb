FactoryBot.define do
  factory :comment do
    content { "MyString" }
    score { 3.5 }
    association :post, factory: :post
    association :user, factory: :user
  end
  factory :comment2 do
    content { "YEAR" }
    score { 1.0 }
    association :post, factory: :post
    association :user, factory: :admin_user
  end
  factory :comment3 do
    content { "MyString2" }
    score { 3.0 }
    association :post, factory: :post2
    association :user, factory: :user
  end
  factory :comment4 do
    content { "YEAR2" }
    score { 4.5 }
    association :post, factory: :post2
    association :user, factory: :admin_user
  end
end
