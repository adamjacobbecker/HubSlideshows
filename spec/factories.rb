FactoryGirl.define do
  factory :hub do
    sequence(:name) { |n| "Hub #{n}" }
    sequence(:email) { |n| "hub_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:email) { |n| "project_#{n}@example.com" }
    hub
  end
end