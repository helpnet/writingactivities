class CreateReviewTypes < ActiveRecord::Migration
  def change
    create_table :review_types do |t|
      t.string :type
      t.references :prompt

      t.timestamps
    end
    add_index :review_types, :prompt_id
  end
end
