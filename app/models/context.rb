class Context < ActiveRecord::Base
  attr_accessible :title, :body, :context_label, :context_title
  
  belongs_to :consumer
  has_many :memberships
  has_many :users, :through => :memberships
end
