class RemovePeerEvaluationsTable < ActiveRecord::Migration
  def up
      drop_table :peer_evaluations
  end

  def down
  end
end
