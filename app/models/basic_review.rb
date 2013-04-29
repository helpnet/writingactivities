class BasicReview < ActiveRecord::Base
  attr_accessible :does_not_work, :main_idea, :works

  belongs_to :user
  belongs_to :submission

  validates_presence_of :main_idea, :does_not_work, :works

end
