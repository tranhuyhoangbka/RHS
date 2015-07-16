module RailsAdmin::Address
  extend ActiveSupport::Concern

  included do
    rails_admin do
      create do
        field :lng
        field :lat
        field :capacity
        field :contact
        field :description
        field :type, :enum do
          enum do
            Address::types
          end
        end
        field :address
        field :user
      end
    end
  end
end
