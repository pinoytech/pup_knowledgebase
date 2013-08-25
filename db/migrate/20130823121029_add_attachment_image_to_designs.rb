class AddAttachmentImageToDesigns < ActiveRecord::Migration
  def self.up
    change_table :designs do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :designs, :image
  end
end
