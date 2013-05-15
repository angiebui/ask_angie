class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers 

  validates_presence_of :title, :body

  attr_accessible :body, :title, :user_id
end
