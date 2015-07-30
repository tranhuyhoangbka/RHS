class Chat < ActiveRecord::Base
  belongs_to :user
  delegate :name, to: :user, allow_nil: true, prefix: true
end
