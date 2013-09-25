class Question < ActiveRecord::Base
  acts_as_voteable
  extend FriendlyId
  attr_accessible :answer, :title, :collection_id, :attachment, :description
  belongs_to :collection
  belongs_to :user
  has_many :answers

  validates :title, presence: {:message => 'Question can\'t be blank'}
  validates :description, presence: true

  has_attached_file :attachment, styles: {large: "700x700#"}
  friendly_id :title, use: :history

  scope :unanswered, ->{joins('LEFT JOIN answers ON answers.question_id = questions.id').where("answers.id IS NULL")}
  scope :recent, lambda{order("id DESC").limit(limit)}
  scope :search, ->(keyword) {where('title LIKE ? ', "%#{keyword}%")}

  def answered?
    answers.any?
  end
end
