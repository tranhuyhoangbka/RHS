module RailsAdmin::Identity
  extend ActiveSupport::Concern

  included do
    rails_admin do
      create do
        field :user
        field :provider
        field :name
        field :email
        field :nickname
        field :phone
        field :urls
      end
    end
  end
end
