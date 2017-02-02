class ChangeProfileAboutUsToText < ActiveRecord::Migration
  def change
    change_column :profile, :about_us, :text
  end
end
