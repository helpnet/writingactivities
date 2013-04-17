class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :context
  attr_accessible :role, :user_id, :context_id

end
