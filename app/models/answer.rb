class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  attr_accessible :body, :question_id, :user_id
end
