class AddAttachmentLogoToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profile do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :profile, :logo
  end
end
