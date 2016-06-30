class AddStakeholderIdToUser < ActiveRecord::Migration
  def change
    add_column :user, :stakeholder_id, :integer
  end
end
