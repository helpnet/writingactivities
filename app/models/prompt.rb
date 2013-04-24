class Prompt < ActiveRecord::Base
  attr_accessible :body, :context, :title

  belongs_to :context
  has_many :submissions

  def has_submission_by?(user)
      user.submissions.map { |s| s.prompt_id }.include?(self.id)
  end

end
