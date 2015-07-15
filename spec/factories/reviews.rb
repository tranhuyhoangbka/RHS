FactoryGirl.define do
  factory :review do
    content {Faker::Lorem.paragraph 2, true}
    point {rand 1..5}
    user
    address
  end
end
