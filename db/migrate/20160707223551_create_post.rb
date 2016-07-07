class CreatePost < ActiveRecord::Migration
  def change
    create_table :post do |t|
      t.string :subject
      t.datetime :start_date
      t.datetime :end_date
      t.text :abstract
      t.text :body
      t.string :contact_email
      t.string :email_subject
      t.text :email_body
      t.boolean :active

      t.timestamps null: false
    end
  end
end
