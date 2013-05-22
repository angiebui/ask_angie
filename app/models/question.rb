class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :answers
  has_and_belongs_to_many :tags
  has_many :votes, :as => :voteable

  validates_presence_of :title, :body

  mount_uploader :photo, PhotoUploader

  attr_accessible :body, :title, :user_id, :topic_id, :photo, :tag_list

  # REVIEW: see my notes on answer.rb
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

  # REVIEW: tell me what you're sorting by in the method name.
  def sort
    self.sort_by { |question| question.answers.count }.reverse!
  end

  def tag_list
    self.tags.map { |t| t.name }.join(", ")
  end

  def tag_list=(new_tags)
    tag_names = new_tags.split(/,\s+/)
    self.tags = tag_names.map { |name| Tag.find_or_create_by_name(name)}
  end

  def self.search(term)
    if term
      questions = where("title LIKE ? OR body LIKE ?", "%#{term}%", "%#{term}%").uniq
      tags = Tag.search(term).map(&:questions).flatten.uniq
      answers = Answer.search(term).map(&:question).uniq
      {:questions => questions, :tags => tags, :answers => answers}
    else
      find(:all)
    end
  end

  # REVIEW: see my notes on the answer.rb
  # DRY
  def vote_count
    upvote = Vote.where("voteable_type = ? AND voteable_id = ? AND upvote = ?", 'Question', self.id, true).count
    downvote = Vote.where("voteable_type = ? AND voteable_id = ? AND upvote = ?",'Question', self.id, false).count
    upvote - downvote
  end

end
