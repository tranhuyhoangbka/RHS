FactoryGirl.define do
  factory :admin, class: User do
    email "admin@rhs.com"
    password "12345678"
    password_confirmation "12345678"
    role Settings.roles.admin
  end

  factory :user do
    sequence(:name) {|n| "user-#{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password "12345678"
    password_confirmation "12345678"
    age {rand{25..100}}
    job "Ruby Developer"
    address Faker::Address.street_address
    phone_number Faker::PhoneNumber.phone_number
    role Settings.roles.normal
  end
end
