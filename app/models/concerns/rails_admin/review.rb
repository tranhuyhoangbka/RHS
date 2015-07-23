module RailsAdmin::Review
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :content
        field :point
        field :user
        field :address
        field :created_at
      end
    end
  end
end
