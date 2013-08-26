FactoryGirl.define do
  factory :question do
    title 'First Question'
    association :collection_id, factory: :collection
    description Faker::Lorem.sentence(3)
    answer Faker::Lorem.sentence(3)
  end
end