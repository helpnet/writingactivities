class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
        t.string :context_label
        t.string :context_title

      t.timestamps
    end
  end
end
