class CreateJoinTableCareerFieldKeyword < ActiveRecord::Migration
  def change
    create_join_table :career_field, :keyword do |t|
       t.index [:career_field_id, :keyword_id]
       t.index [:keyword_id, :career_field_id]
    end
  end
end
