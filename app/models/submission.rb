class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  attr_accessible :body

  has_many :basic_reviews, :dependent => :destroy

  def has_been_reviewed_by?(user)
      user.basic_reviews.map { |e| e.submission_id }.include?(self.id)
  end

end
