FactoryBot.define do
  factory :user do
    name {"test"}
    email { "test@gmail.com" }
    password { "juri1234" }
    password_confirmation { 'juri1234' }
    admin { true }
  end

  factory :user2, class: User do
    name {"admin"}
    email { "admin@gmail.com" }
    password { "may1234" }
    password_confirmation { 'may1234' }
    admin { true }
  end

  # factory :user3, class: User do
  #   name {"lisa"}
  #   email { "lisa@gmail.com" }
  #   password { "lisa1234" }
  #   password_confirmation { 'lisa1234' }
  #   admin { true }
  # end
end