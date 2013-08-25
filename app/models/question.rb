class Question < ActiveRecord::Base
  acts_as_voteable
  extend FriendlyId
  attr_accessible :answer, :title, :collection_id, :attachment, :description
  belongs_to :collection
  belongs_to :user

  validates :title, :presence => {:message => 'Question can\'t be blank'}
  validates :description, presence: true

  has_attached_file :attachment
  friendly_id :title, use: :history

  scope :recent, lambda{|limit| order("id DESC").limit(limit)}
  scope :search, lambda{|keyword| where('title LIKE ? ', "%#{keyword}%")}
end
