class CreateKeyword < ActiveRecord::Migration
  def change
    create_table :keyword do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
