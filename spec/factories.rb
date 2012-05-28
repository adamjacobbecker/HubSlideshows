FactoryGirl.define do
  factory :hub do
    sequence(:name) { |n| "Hub #{n}" }
    sequence(:email) { |n| "hub_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
end