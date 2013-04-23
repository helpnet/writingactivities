class Prompt < ActiveRecord::Base
  attr_accessible :body, :context, :title

  belongs_to :context

end
