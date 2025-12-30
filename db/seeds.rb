# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

COMPANIES = 34
LEADS = 7
PEOPLE = 15
ROLES = 12

# Clean out the existing data
[ Role, Person, Company, Contact, Lead, User ].each(&:destroy_all)

# Create Companies
COMPANIES.times do
  Company.create!(
    logo: File.open(Rails.root.join("test", "fixtures", "files", "logos", "#{rand(1..12)}.png")),
    name: Faker::Company.unique.name,
    tagline: Faker::Company.catch_phrase
  )
end

# Create people
PEOPLE.times do
  Person.create!(
    first_name: Faker::Name.first_name,
    last_names: Faker::Name.last_name
  )
end

# Assign roles
ROLES.times do
  company = Company.order("RANDOM()").first
  person = Person.order("RANDOM()").first

  Role.create!(
    company: company,
    person: person,
    title: Faker::Job.title
  )
end

# Create leads
LEADS.times do
  Lead.create!(
    name: Faker::Commerce.product_name,
    state: [ "new", "contacted", "qualified", "won", "lost" ].sample
  )
end

# Assign contacts to leads
Lead.all.each do |lead|
  rand(1..3).times do
    recipient = [ Company.order("RANDOM()").first, Person.order("RANDOM()").first ].sample
    Contact.create!(
      lead: lead,
      contactable: recipient,
    )
  end
end

# Create projects for companies
Company.all.each do |company|
  rand(1..4).times do
    Project.create!(
      company: company,
      name: Faker::App.unique.name,
      starts_on: Faker::Date.backward(days: 100),
      ends_on: Faker::Date.forward(days: 100)
    )
  end
end

# Create an admin user
User.find_or_create_by!(email_address: "uchi@example.com") do |user|
  user.password = "password"
end
