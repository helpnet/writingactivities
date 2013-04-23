class RemoveUserReferencesFromPrompts < ActiveRecord::Migration
  def up
      remove_column :prompts, :user_id
  end

  def down
  end
end
