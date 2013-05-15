class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  validates_presence_of :body

  attr_accessible :body, :question_id, :user_id
end
