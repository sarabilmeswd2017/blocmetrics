require 'faker'

u = User.create(
email: 'joe@user.com',
password: 'password',
confirmed_at: Time.now
)

15.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  confirmed_at: Time.now
  )
end
users = User.all

50.times do

  RegisteredApplication.create!(
  name: Faker::Lorem.sentence,
  url:  Faker::Internet.domain_name,
  user: users.sample
  )
end
registered_applications = RegisteredApplication.all

100.times do
  e = Event.create(
    name: Faker::Name.name,
    registered_application: registered_applications.sample
  )
  e.update(created_at: (Time.now - rand(3..7).days))
end

puts "Seed finished"
puts "#{RegisteredApplication.count} RegisteredApplications created"
puts "#{User.count} users created"
puts "#{Event.count} events created"
