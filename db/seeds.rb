# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Role.destroy_all
Project.destroy_all
Comment.destroy_all

%i[sales_agent, buyer, seller, solicitor].each do |name|
  role = Role.create(name: name)

  10.times do
    User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, role:)
  end
end

20.times do |i|
  Project.create(name: "Project #{i}")
end
