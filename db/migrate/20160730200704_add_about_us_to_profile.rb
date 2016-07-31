class AddAboutUsToProfile < ActiveRecord::Migration
  def change
    add_column :profile, :about_us, :string
  end
end
