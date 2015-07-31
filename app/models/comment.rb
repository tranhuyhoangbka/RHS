class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true

  mount_uploader :image, PhotoUploader

  paginates_per Settings.pagination.comment.per_page
end
