class RemovePromptIdFromResearchIntroductionReviews < ActiveRecord::Migration
  def up
    remove_column :research_introduction_reviews, :prompt_id
  end

  def down
    add_column :research_introduction_reviews, :prompt_id, :integer
  end
end
