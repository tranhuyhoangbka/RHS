class Address < ActiveRecord::Base
  include RailsAdmin::Address
  attr_accessor :google_map

  validates :capacity, presence: true
  validates :contact, presence: true
  validates :address, presence: true
  validates :square, presence: true
  validates :price, presence: true
  validates :description, presence: true

  paginates_per Settings.pages.ten

  belongs_to :user
  belongs_to :region
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  delegate :province, to: :region

  def simplify_price
    "#{price/1000000} M" if price >= 1000000
  end

  scope :by_province, ->province{joins(:region).where "regions.province = ?", province}

  enum type: [:apartment, :villa]

  def average_point
    reviews.average :point
  end

  PARAMS_ATTRIBUTES = [
    :id, :lng, :lat, :capacity, :contact,
    :description, :type, :square, :address, :price, :parking,
    :air_conditioner, :ceilling_fan, :bed, :washing_machine, :television,
    :network, :table, :chair, images_attributes: [:id, :photo, :is_main, :_destroy]
  ]
end
