class AddConsumerToContext < ActiveRecord::Migration
  def change
      change_table :contexts do |t|
          t.references :consumer
      end
  end
end
