class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: [:normal, :admin]
end
