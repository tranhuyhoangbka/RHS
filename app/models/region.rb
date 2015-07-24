class Region < ActiveRecord::Base
  include RailsAdmin::Region

  has_many :addresses, dependent: :destroy

  scope :homes, ->{where(is_home: true).limit(Settings.num_of_show_location)}
end
