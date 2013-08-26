namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    puts '=== Create Founders ==='
    User.create(email: 'teejay@email.com', password: 'password')
    User.create(email: 'ken@email.com', password: 'password')
    User.create(email: 'don@email.com', password: 'password')
    puts '=== Created Founders ==='

    puts '=== Create Collections ==='
    8.times do
      Collection.create name: Faker::Lorem.word.titleize
      Collection.create name: Faker::Lorem.word.titleize
    end
    puts "=== Created Collections ==="

    puts "=== Create Users ==="
    16.times do
      User.create email: Faker::Internet.email, password: 'password', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
    end
    puts "=== Created Users ==="

    puts '=== Create Questions ==='
    524.times do |i|
      if [true, false].sample
        User.random.first.questions.create title: Faker::Lorem.sentence(3), description: Faker::Lorem.paragraph, answer: Faker::Lorem.paragraphs.join("\n"), collection_id: [Collection.random.first.id].sample
      else
        User.random.first.questions.create title: Faker::Lorem.sentence(3), description: Faker::Lorem.paragraph, collection_id: [Collection.random.first.id].sample
      end
    end
    puts '=== Created Questions ==='
  end
end