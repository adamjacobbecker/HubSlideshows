namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_hubs
    make_projects
  end
end

def make_hubs 
  Hub.create!(name: "Hub Berkeley", email: "example@example.com", password: "foobar", password_confirmation: "foobar")
  Hub.create!(name: "Hub San Francisco", email: "sf@example.com", password: "foobar", password_confirmation: "foobar")
end

def make_projects
  hubs = Hub.all(limit: 6)
  
  10.times do
    company_name = Faker::Company.name
    hubs.each { |hub| hub.projects.create(name: company_name, email: "example@example.com") }
  end
end
