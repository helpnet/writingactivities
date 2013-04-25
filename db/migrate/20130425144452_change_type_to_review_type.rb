class ChangeTypeToReviewType < ActiveRecord::Migration
  def up
      rename_column :review_types, :type, :review_type
  end

  def down
  end
end
