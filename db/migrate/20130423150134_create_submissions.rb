class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user
      t.references :prompt
      t.text :body

      t.timestamps
    end
    add_index :submissions, :user_id
    add_index :submissions, :prompt_id
  end
end
