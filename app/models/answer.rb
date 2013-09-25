class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :user_id
  belongs_to :user
  belongs_to :question
  validates :body, presence: true
end
