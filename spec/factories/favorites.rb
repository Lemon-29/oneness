FactoryBot.define do
  factory :favorite do
    association :post, factory: :post
    association :user, factory: :user
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite2 do
    association :post2, factory: :post2
    association :user, factory: :user
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite3 do
    association :post, factory: :post
    association :user, factory: :admin_user
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite4 do
    association :post2, factory: :post2
    association :user, factory: :admin_user
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
end
