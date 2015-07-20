module RailsAdmin::Address
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :title
        field :capacity
        field :address
        field :contact
        field :user_id
        field :rating
      end

      edit do
        field :google_map, :map do
          label "Map"
          help false
        end
        field :lat do
          label "Latitude"
          help false
          html_attributes do
            {readonly: true}
          end
        end
        field :lng do
          label "Longitude"
          help false
          html_attributes do
            {readonly: true}
          end
        end
        field :title
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
        field :images
      end
    end
  end
end
