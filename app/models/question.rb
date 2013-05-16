class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers 

  validates_presence_of :title, :body

  attr_accessible :body, :title, :user_id, :photo

  mount_uploader :photo, PhotoUploader

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

  def self.answer_count
    all.sort_by { |question| -question.answers.count }
  end

end
