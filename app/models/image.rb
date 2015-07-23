class Image < ActiveRecord::Base
  include RailsAdmin::Image

  mount_uploader :photo, PhotoUploader
  belongs_to :address
end
