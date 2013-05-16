class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :answer
      t.references :user
      t.boolean :upvote 

      t.timestamps
    end
    add_index :votes, [:answer_id, :user_id], 
  end
end
