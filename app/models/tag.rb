class Tag < ActiveRecord::Base
  has_and_belongs_to_many :questions
  attr_accessible :name

  def self.search(term)
    where("name LIKE ?", "%#{term}%")
  end
end
