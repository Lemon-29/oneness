FactoryBot.define do
  factory :user do
    email { "juri@gmail.com" }
    password { "juri1234" }
    password_confirmation { 'juri1234' }
    admin { true }
  end

  factory :user2, class: User do
    email { "may@gmail.com" }
    password { "may@gmail.com" }
    password_confirmation { 'may1234' }
    admin { true }
  end

  factory :third_user, class: User do
    email { "lisa@gmail.com" }
    password { "lisa1234" }
    password_confirmation { 'lisa1234' }
    admin { true }
  end
end