class Image < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :address
  belongs_to :room
end
