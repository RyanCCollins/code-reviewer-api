# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    password: 'password',
    bio: FFaker::HipsterIpsum.phrase
  )
end

users = User.all

10.times do
  word_1 = FFaker::HipsterIpsum.word
  word_2 = FFaker::HipsterIpsum.word
  project = Project.create(
    title: '#{word_1.capitalize} #{word_2.capitalize}',
    url: FFaker::Internet.http_url,
    description: FFaker::HipsterIpsum.paragraph,
    user: users.sample,
    slug: '#{word_1}-#{word_2}'
  )
  5.times do
    Comment.create(
      body: FFaker::HipsterIpsum.paragraph,
      user: users.sample,
      project: project
    )
  end
end
