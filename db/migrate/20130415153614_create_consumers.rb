class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name
      t.string :key
      t.string :secret

      t.timestamps
    end
  end
end
