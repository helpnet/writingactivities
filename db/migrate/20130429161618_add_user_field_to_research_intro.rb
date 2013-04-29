class AddUserFieldToResearchIntro < ActiveRecord::Migration
  def change
        add_column :research_introduction_reviews, :user_id, :integer
      add_index :research_introduction_reviews, :user_id
      add_index :research_introduction_reviews, :submission_id
  end
end
