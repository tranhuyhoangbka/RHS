class Region < ActiveRecord::Base
  include RailsAdmin::Region

  has_many :addresses, dependent: :destroy

  scope :get_special, -> {where(special_location: true)
    .limit(Settings.num_of_show_location)}
end
