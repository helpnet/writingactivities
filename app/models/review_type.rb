class ReviewType < ActiveRecord::Base
  belongs_to :prompt
  attr_accessible :review_type

  @@review_types = {:basic_reviews => "Basic Review"}

  def self.review_types
      @@review_types
  end

end