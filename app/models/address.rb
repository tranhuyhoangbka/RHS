class Address < ActiveRecord::Base
  belongs_to :user
  has_many :rooms, dependent: :destroy
  enum type: [:apartment, :villa]
end
