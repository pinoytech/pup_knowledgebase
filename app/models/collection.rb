class Collection < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name
  has_many :questions
  friendly_id :name, use: :history
end
