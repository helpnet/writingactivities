class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :context
  attr_accessible :role, :user_id, :context_id

  @@roles = { "urn:lti:role:ims/lis/learner" => "learner", "urn:lti:role:ims/lis/Instructor" => "instructor"}

  def self.roles
      @@roles
  end

end
