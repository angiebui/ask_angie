class AddTopicToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :topic_id, :integer, :references => :topics
  end
end
