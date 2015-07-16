module RailsAdmin::User
  extend ActiveSupport::Concern

  included do
    rails_admin do
      create do
        field :name
        field :email
        field :password
        field :password_confirmation
        field :job
        field :age
        field :phone_number
        field :address
        field :role, :enum do
          enum do
            User::roles
          end
        end
      end
    end
  end
end
