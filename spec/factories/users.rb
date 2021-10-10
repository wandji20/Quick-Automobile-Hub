FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    telephone { Faker::PhoneNumber }
    user_name { Faker::Name.unique }
    verified { true }
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
