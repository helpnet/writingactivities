class RemoveUserContextJoinTable < ActiveRecord::Migration
  def up
      drop_table :contexts_users
  end

  def down
  end
end
