class CreateUserRole < ActiveRecord::Migration
  def change
    create_table :user_role do |t|
      t.integer :user_id
      t.string :role

      t.timestamps null: false
    end
  end
end
