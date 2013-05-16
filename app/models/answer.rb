class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  after_save :answer_notification_email

  validates_presence_of :body

  attr_accessible :body, :question_id, :user_id

  # scope :vote_count, order()
  # ((Vote.where("answer_id = ? AND upvote = ?", self.id, true).count) - (Vote.where("answer_id = ? AND upvote = ?", self.id, false).count))

  def answer_notification_email
    QuestionMailer.answer_notification(self).deliver
  end

  def time_ago 
    ((Time.now - self.created_at) / 1.hour).round
  end

  def self.sorted_by_vote
    all.sort_by { |answer| -answer.vote_count }
  end

  def vote_count
    upvote = Vote.where("answer_id = ? AND upvote = ?", self.id, true).count
    downvote = Vote.where("answer_id = ? AND upvote = ?", self.id, false).count
    upvote - downvote 
  end

end
