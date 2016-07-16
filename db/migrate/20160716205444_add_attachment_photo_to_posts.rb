class AddAttachmentPhotoToPosts < ActiveRecord::Migration
  def self.up
    change_table :post do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :post, :photo
  end
end
