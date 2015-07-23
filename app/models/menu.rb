class Menu < ActiveRecord::Base
  include RailsAdmin::Menu

  has_ancestry
  before_save {self.url = url.empty? ? "#" : url.downcase}
  scope :top, ->{where postion: 0}
  scope :bottom, ->{where postion: 1}
  enum postion: [:top, :bottom]
end
