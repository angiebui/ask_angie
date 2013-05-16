class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  after_save :answer_notification_email

  validates_presence_of :body

  attr_accessible :body, :question_id, :user_id

  mount_uploader :photo, PhotoUploader

  def answer_notification_email
    QuestionMailer.answer_notification(self).deliver
  end

  def time_ago 
    ((Time.now - self.created_at) / 1.hour).round
  end

  def vote_count
  end

end
