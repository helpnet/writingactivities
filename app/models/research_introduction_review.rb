class ResearchIntroductionReview < ActiveRecord::Base
  belongs_to :prompt
  attr_accessible :clarity, :hook, :so_what

  validates_presence_of :clarity, :hook, :so_what

end
