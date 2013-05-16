class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  validates_presence_of :body

  attr_accessible :body, :question_id, :user_id

  def time_ago 
    ((Time.now - self.created_at) / 1.hour).round
  end

  def vote_count
  end

end
