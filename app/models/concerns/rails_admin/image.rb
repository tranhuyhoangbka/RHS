module RailsAdmin::Image
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false

      edit do
        field :photo
      end
    end
  end
end
