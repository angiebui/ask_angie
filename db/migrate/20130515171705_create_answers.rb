class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.text :body, :null => false
      
      t.timestamps
    end
      add_index :answers, [:question_id, :user_id]
  end
end
