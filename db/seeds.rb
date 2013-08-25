# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# coding: utf-8

@user = User.create(email: 'teejay@email.com', password: 'password')
@user2 = User.create(email: 'ken@email.com', password: 'password')
@user3 = User.create(email: 'don@email.com', password: 'password')

@collection = Collection.create name: 'Enrollment'
@collection2 = Collection.create name: 'Classes'
@collection3 = Collection.create name: 'Subjects'

[@user, @user2, @user3].each do |n|
    n.questions.create title: Faker::Lorem::words(3), description: Faker::Lorem::paragraphs, answer: Faker::Lorem::paragraphs, collection_id: [1,2,3].sample
end