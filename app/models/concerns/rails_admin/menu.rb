module RailsAdmin::Menu
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :name
        field :url
        field :postion
      end
      edit do
        field :name
        field :url
        field :postion, :enum do
          enum do
            Menu::postions
          end
        end
      end
      nestable_tree({
        max_depth: 2
      })
    end
  end
end
