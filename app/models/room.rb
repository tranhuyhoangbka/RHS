class Room < ActiveRecord::Base
  belongs_to :address
  has_many :images

  def simplify_price  
    "#{price/1000000} M" if price >= 1000000
  end
end
