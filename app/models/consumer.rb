class Consumer < ActiveRecord::Base
  attr_accessible :key, :name, :secret

  has_many :contexts
end
