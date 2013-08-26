class Collection < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name
  has_many :questions
  friendly_id :name, use: :history

  scope :random, order("RAND()").limit(1)
end
