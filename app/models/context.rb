class Context < ActiveRecord::Base
  attr_accessible :title, :body, :context_label, :context_title
  
  belongs_to :consumer
  has_and_belongs_to_many :users
end
