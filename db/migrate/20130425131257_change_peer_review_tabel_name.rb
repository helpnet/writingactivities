class ChangePeerReviewTabelName < ActiveRecord::Migration
  def up
      rename_table :peer_evaluations, :basic_reviews
  end

  def down
  end
end
