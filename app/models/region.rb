class Region < ActiveRecord::Base
  include RailsAdmin::Region

  has_many :addresses, dependent: :destroy
end
