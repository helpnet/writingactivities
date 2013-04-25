class BasicReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  attr_accessible :does_not_work, :main_idea, :works
end
