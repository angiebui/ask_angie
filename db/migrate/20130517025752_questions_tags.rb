class QuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags, :id => false do |t|
        t.references :question
        t.references :tag
    end
    add_index :questions_tags, [:question_id, :tag_id], :unique => true
  end
end
