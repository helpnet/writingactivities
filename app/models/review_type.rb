class ReviewType < ActiveRecord::Base
  belongs_to :prompt
  attr_accessible :review_type, :prompt_id

  @@review_types = {:basic_reviews => "Basic Review", :research_introduction_reviews => "Research Introduction Review"}

  def self.review_types
      @@review_types
  end

end
