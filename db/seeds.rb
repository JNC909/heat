# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create regular members
Member.create!(member_name: 'John Doe', member_points: 100, executive_status: false)
Member.create!(member_name: 'Jane Smith', member_points: 150, executive_status: false)

# Create executive members with specific email addresses
executive_emails = ['executive1@example.com', 'executive2@example.com']
executive_emails.each do |email|
  Member.create!(member_name: 'Executive Member', member_points: 200, executive_status: true, email: email)
end
