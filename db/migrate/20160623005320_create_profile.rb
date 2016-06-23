class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profile do |t|
      t.integer :stakeholder_id
      t.string :website_url
      t.string :facebook_url
      t.string :youtube_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :name
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
