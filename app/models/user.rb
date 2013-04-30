class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :memberships
  has_many :contexts, :through => :memberships
  has_many :submissions
  has_many :basic_reviews
  has_many :research_introduction_reviews

  def has_given_review_by_type(type, submission)
      reviews = self.send(type)
      reviews.map(&:submission_id).include?(submission.id)
  end

  def role_in(context)
      self.memberships.where('context_id = ?', context.id).first.role
  end

end
