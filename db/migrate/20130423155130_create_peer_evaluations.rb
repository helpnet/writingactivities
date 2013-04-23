class CreatePeerEvaluations < ActiveRecord::Migration
  def change
    create_table :peer_evaluations do |t|
      t.references :user
      t.references :submission
      t.text :works
      t.text :does_not_work
      t.text :main_idea

      t.timestamps
    end
    add_index :peer_evaluations, :user_id
    add_index :peer_evaluations, :submission_id
  end
end
