class AddStakeholderIdToPost < ActiveRecord::Migration
  def change
    add_column :post, :stakeholder_id, :integer
  end
end
