class Topic < ActiveRecord::Base
  has_many :questions
  attr_accessible :title 

  def self.topic_sort
    all.sort_by { |topic| topic.title }
  end
end
