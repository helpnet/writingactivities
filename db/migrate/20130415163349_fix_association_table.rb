class FixAssociationTable < ActiveRecord::Migration
  def up
      create_table :contexts_users, :id => false do |t|
          t.references :context, :null => false
          t.references :user, :null => false
      end
      add_index(:contexts_users, [:context_id, :user_id], :unique => true)
  end

  def down
  end
end
