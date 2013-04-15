class DestroyAssociationTable < ActiveRecord::Migration
  def up
      drop_table :consumers_contexts
  end

  def down
  end
end
