FactoryBot.define do
  factory :comment do
    content { "MyString" }
    score { 3.5 }
    association :post, factory: :post
    user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
  end
  factory :comment2, class: 'Comment' do
    content { "YEAR" }
    score { 1.0 }
    association :post, factory: :post
    user_id { (User.find_by(email: FactoryBot.build(:user2).email) || FactoryBot.create(:user2)).id }
  end
  factory :comment3, class: 'Comment' do
    content { "MyString2" }
    score { 3.0 }
    association :post, factory: :post2
    user_id { (User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)).id }
  end
  factory :comment4, class: 'Comment' do
    content { "YEAR2" }
    score { 4.5 }
    association :post, factory: :post2
    user_id { (User.find_by(email: FactoryBot.build(:user2).email) || FactoryBot.create(:user2)).id }
  end
end
