class FixResearchIntroReviewTable < ActiveRecord::Migration
  def up
      remove_column :research_introduction_reviews, :prompts
      add_column :research_introduction_reviews, :submission_id, :integer
  end

  def down
  end
end
