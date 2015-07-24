module RailsAdmin::Region
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :province
        field :is_home
      end
    end
  end
end
