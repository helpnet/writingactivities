class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  attr_accessible :body

  has_many :basic_reviews, :dependent => :destroy
  has_many :research_introduction_reviews, :dependent => :destroy

end
