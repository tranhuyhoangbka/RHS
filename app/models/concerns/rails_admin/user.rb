module RailsAdmin::User
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :name
        field :email
        field :phone_number
        field :role
        field :created_at
      end
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
            User::roles.keys
            [["normal", "normal"], ["admin", "admin"]]
          end
        end
      end
    end
  end
end
