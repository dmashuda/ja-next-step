class AddAttachmentBannerToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profile do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :profile, :banner
  end
end
