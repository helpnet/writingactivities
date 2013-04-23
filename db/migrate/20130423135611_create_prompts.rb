class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :body
      t.references :context
      t.references :user

      t.timestamps
    end
  end
end
