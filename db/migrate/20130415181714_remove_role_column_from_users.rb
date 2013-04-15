class RemoveRoleColumnFromUsers < ActiveRecord::Migration
  def up
      change_table :users do |t|
          t.remove :role
      end
  end

  def down
  end
end
