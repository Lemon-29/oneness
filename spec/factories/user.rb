# require 'rails_helper'
# require "cancan/matchers"


FactoryBot.define do
  factory :user do
    name {"juri"}
    email { "admin@yahoo.com" }
    password { "juri1234" }
    password_confirmation { 'juri1234' }
    admin { true }
  end

  factory :user2, class: User do
    name {"may"}
    email { "may@gmail.com" }
    password { "may1234" }
    password_confirmation { 'may1234' }
  end

  # factory :user3, class: User do
  #   name {"lisa"}
  #   email { "lisa@gmail.com" }
  #   password { "lisa1234" }
  #   password_confirmation { 'lisa1234' }
  #   admin { true }
  # end
end