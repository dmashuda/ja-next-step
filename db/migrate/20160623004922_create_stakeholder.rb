class CreateStakeholder < ActiveRecord::Migration
  def change
    create_table :stakeholder do |t|

      t.timestamps null: false
    end
  end
end
