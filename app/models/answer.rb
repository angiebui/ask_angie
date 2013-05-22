class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, :as => :voteable
  after_save :answer_notification_email

  validates_presence_of :body

  attr_accessible :body, :question_id, :user_id

  def answer_notification_email
    # REVIEW: it sounds like this should be AnswerMailer ?
    QuestionMailer.answer_notification(self).deliver
  end

  # REVIEW: I think there is a time_ago or something similar in rails.
  def time_ago
    time = (Time.now - self.created_at)
    if time > 86400
      "#{time.to_i/86400} days ago"
    elsif time > 7200
      "#{time.to_i/3600} hours ago"
    elsif time > 3600
      "#{time.to_i/3600} hour ago"
    elsif time > 60
      "#{time.to_i/60} minutes ago"
    else
      "just now"
    end
  end

  def self.sorted_by_vote
    all.sort_by { |answer| -answer.vote_count }
  end

  # REVIEW: move .where("voteable_type = ? AND voteable_id = ? AND upvote = ?", 'Answer', self.id, true).count call
  # to Vote model and call it here. Maybe Vote.upvotes_for(voteable)
  def vote_count
    upvote = Vote.where("voteable_type = ? AND voteable_id = ? AND upvote = ?", 'Answer', self.id, true).count
    downvote = Vote.where("voteable_type = ? AND voteable_id = ? AND upvote = ?",'Answer', self.id, false).count
    upvote - downvote
  end

  def self.search(term)
    where("body LIKE ?", "%#{term}%")
  end
end
