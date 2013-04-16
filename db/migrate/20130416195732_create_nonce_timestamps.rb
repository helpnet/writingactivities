class CreateNonceTimestamps < ActiveRecord::Migration
  def change
    create_table :nonce_timestamps, :id => false do |t|

      t.timestamps
    end
  end
end
