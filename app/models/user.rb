class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :avatar, :description
  # attr_accessible :title, :body

  acts_as_voter

  has_many :designs
  has_many :questions
  has_attached_file :avatar, :styles => {
    :medium => "200x200>",
    :small => "100x100>"
  }

  scope :founders, order('id ASC').limit(3)

  def full_name
    "#{first_name} #{last_name}"
  end
end
