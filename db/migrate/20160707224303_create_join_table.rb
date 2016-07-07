class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :post, :keyword do |t|
       t.index [:post_id, :keyword_id]
       t.index [:keyword_id, :post_id]
    end
  end
end
