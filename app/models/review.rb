class Review < ActiveRecord::Base
  include RailsAdmin::Review

  belongs_to :user
  belongs_to :address
  has_many :comments, dependent: :destroy
end
