class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :answers
  has_and_belongs_to_many :tags

  validates_presence_of :title, :body

  mount_uploader :photo, PhotoUploader

  attr_accessible :body, :title, :user_id, :topic_id, :photo, :tag_list

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

  def tag_list
    self.tags.map { |t| t.name }.join(", ")
  end

  def tag_list=(new_tags)
    tag_names = new_tags.split(/,\s+/)
    self.tags = tag_names.map { |name| Tag.find_or_create_by_name(name)}
  end

end
