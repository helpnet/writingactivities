class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  attr_accessible :body

  has_many :peer_evaluations, :dependent => :destroy

  def has_been_reviewed_by?(user)
      user.peer_evaluations.map { |e| e.submission_id }.include?(self.id)
  end

end
