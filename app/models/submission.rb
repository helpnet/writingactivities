class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  attr_accessible :body

  has_many :basic_reviews, :dependent => :destroy
  has_many :research_introduction_reviews, :dependent => :destroy

  def number_of_reviews
      @number_of_reviews = 0

      self.prompt.review_types.map(&:review_type).each do |type|
          @number_of_reviews += self.send(type.to_sym).length
      end
      
      @number_of_reviews
  end

end
