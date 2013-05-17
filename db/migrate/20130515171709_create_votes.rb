class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, :polymorphic => true
      t.references :user
      t.boolean :upvote 

      t.timestamps
    end
    add_index :votes, [:voteable_id, :user_id], :unique => true, :name => 'vote_key'
  end
end
