FactoryGirl.define do
  factory :comment do
    content {Faker::Lorem.sentence 3, true}
    user
    review
  end
end
