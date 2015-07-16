class Address < ActiveRecord::Base
  include RailsAdmin::Address

  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  enum type: [:apartment, :villa]
end
