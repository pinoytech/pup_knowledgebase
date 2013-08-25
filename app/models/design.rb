class Design < ActiveRecord::Base

  attr_accessible :name, :user_id, :image

  belongs_to :user

  has_attached_file :image, :styles => {
    :medium => "213x200>"
  }
end
