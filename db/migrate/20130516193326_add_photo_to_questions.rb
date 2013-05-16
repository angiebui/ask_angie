class AddPhotoToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :photo, :string
  end
end
