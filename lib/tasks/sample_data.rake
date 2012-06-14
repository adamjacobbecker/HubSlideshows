namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_hubs
  end
end

def make_hubs 
  Hub.create!(name: "Hub Berkeley", email: "example@example.com", password: "foobar", password_confirmation: "foobar")
  Hub.create!(name: "Hub San Francisco", email: "sf@example.com", password: "foobar", password_confirmation: "foobar")
end
