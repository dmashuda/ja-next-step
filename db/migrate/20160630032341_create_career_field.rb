class CreateCareerField < ActiveRecord::Migration
  def change
    create_table :career_field do |t|
      t.string :label
      t.boolean :active

      t.timestamps null: false
    end
  end
end
