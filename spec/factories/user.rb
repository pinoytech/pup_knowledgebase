FactoryGirl.define do
  factory :user do
    email 'teejay.obazee@email.com'
    password 'password'
    password_confirmation 'password'
    first_name 'Teejay'
    last_name 'Obazee'
    description Faker::Lorem.sentence(3)
  end
end