class Question < ActiveRecord::Base
  acts_as_voteable
  attr_accessible :answer, :title, :collection_id, :attachment
  belongs_to :collection

  has_attached_file :attachment

  scope :recent, lambda{|limit| order("id DESC").limit(limit)}
end
