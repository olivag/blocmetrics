# Create Users
member1 = User.new(
  name: 'Gerald Oliva',
  email: 'ryumaster001@yahoo.com',
  password: "helloworld"
  )
member1.skip_confirmation!
member1.save!

member2 = User.new(
  name: 'John Smith',
  email: 'example2@yahoo.com',
  password: "helloworld"
  )
member2.skip_confirmation!
member2.save!

member3 = User.new(
  name: 'Homer Simpson',
  email: 'example3@yahoo.com',
  password: "helloworld"
  )
member3.skip_confirmation!
member3.save!

users = User.all

# Create Registered Applications
25.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url,
    user: users.sample
    )
end

registered_applications = RegisteredApplication.all

# Create Events
100.times do
  Event.create!(
    name: Faker::App.name,
    registered_application: registered_applications.sample
    )
end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Event.count} events created."
puts "#{RegisteredApplication.count} registered applications created."