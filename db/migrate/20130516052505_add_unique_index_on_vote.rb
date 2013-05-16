class AddUniqueIndexOnVote < ActiveRecord::Migration
  def up
  	remove_index :votes, :column => [:answer_id, :user_id]
  	add_index :votes, [:answer_id, :user_id], :unique => true, :name => 'vote_key'
  end

  def down
  	add_index :votes, [:answer_id, :user_id]
  end
end
