class AddNameToStakeholder < ActiveRecord::Migration
  def change
    add_column :stakeholder, :name, :string
  end
end
