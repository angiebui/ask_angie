class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :votes
  has_many :answers

  attr_accessible :username, :email, :password, :gender

  validates :username, :email, :password, :gender, :presence => true
  validates :username, :email, :uniqueness => true
  validates :password, :length => { :minimum => 5}

  validate :valid_email

  # REVIEW: you can use the :format option in the validate.
  def valid_email
    unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
      errors.add(:email, "is not valid, girl")
    end
  end
  # REVIEW: you're too deep into vote model, create a method on Vote and delegate the call to it.
  def upvoted? voteable
    votes = self.votes.where("voteable_id = ? AND voteable_type = ?", voteable.id, voteable.class.to_s).last.upvote?
  end

  def voted? voteable
    vote = self.votes.find_by_voteable_id_and_voteable_type(voteable.id, voteable.class.to_s)
  end

end
