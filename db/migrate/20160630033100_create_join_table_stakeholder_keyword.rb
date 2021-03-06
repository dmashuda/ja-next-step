class CreateJoinTableStakeholderKeyword < ActiveRecord::Migration
  def change
    create_join_table :stakeholder, :keyword do |t|
       t.index [:stakeholder_id, :keyword_id]
       t.index [:keyword_id, :stakeholder_id]
    end
  end
end
