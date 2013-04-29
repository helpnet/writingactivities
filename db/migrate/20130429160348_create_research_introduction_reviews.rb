class CreateResearchIntroductionReviews < ActiveRecord::Migration
  def change
    create_table :research_introduction_reviews do |t|
      t.references :prompt
      t.text :so_what
      t.text :hook
      t.text :clarity

      t.timestamps
    end
    add_index :research_introduction_reviews, :prompt_id
  end
end
