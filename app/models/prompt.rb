class Prompt < ActiveRecord::Base
  attr_accessible :body, :context, :title, :review_types_attributes

  belongs_to :context
  has_many :submissions
  has_many :review_types, :dependent => :destroy


  def has_submission_by?(user)
      user.submissions.map { |s| s.prompt_id }.include?(self.id)
  end

end
