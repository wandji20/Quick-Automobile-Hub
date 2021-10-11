FactoryBot.define do
  factory :car do
    user { nil }
    manufacturer { 'MyString' }
    year { 'MyString' }
    mileage { 1000 }
    location { 'MyString' }
    price { 1 }
    category { nil }
  end
end
