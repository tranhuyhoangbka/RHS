class Room < ActiveRecord::Base
  belongs_to :address
  has_many :images
end
