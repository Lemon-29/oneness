FactoryBot.define do
  factory :favorite do
    # association :post, factory: :post
    # user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite2, class: 'Favorite' do
    association :post2, factory: :post2
    user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite3, class: 'Favorite' do
    association :post, factory: :post
    user_id { (User.find_by(email: FactoryBot.build(:user2).email) || FactoryBot.create(:user2)).id }
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
  factory :favorite4, class: 'Favorite' do
    association :post2, factory: :post2
    user_id { (User.find_by(email: FactoryBot.build(:user2).email) || FactoryBot.create(:user2)).id }
    created_at { "2021-06-14 22:28:32" }
    updated_at { "2021-06-14 22:28:32" }
  end
end
