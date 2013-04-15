class UserContextTable < ActiveRecord::Migration
  def up
      create_table :consumers_contexts, :id => false do |t|
          t.references :consumer, :null => false
          t.references :context, :null => false
      end
      add_index(:consumers_contexts, [:consumer_id, :context_id], :unique => true)
  end

  def down
  end
end
