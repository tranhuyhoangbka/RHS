FactoryGirl.define do
  factory :admin, class: User do
    email "admin@rhs.com"
    password "12345678"
    password_confirmation "12345678"
    role Settings.roles.admin
  end
end
