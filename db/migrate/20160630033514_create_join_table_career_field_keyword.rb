class CreateJoinTableCareerFieldKeyword < ActiveRecord::Migration
  def change
    create_join_table :CareerField, :Keyword do |t|
      # t.index [:career_field_id, :keyword_id]
      # t.index [:keyword_id, :career_field_id]
    end
  end
end
