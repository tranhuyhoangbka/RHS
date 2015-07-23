class Address < ActiveRecord::Base
  include RailsAdmin::Address
  attr_accessor :google_map

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

  scope :by_province, -> province{joins(:region)
    .where("regions.province = ?", province)
    .order(created_at: :desc).limit(Settings.num_of_adds_in_regions)}

  enum type: [:apartment, :villa]
end
