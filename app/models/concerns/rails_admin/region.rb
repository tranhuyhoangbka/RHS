module RailsAdmin::Region
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :province
      end
    end
  end
end
