class AddValuesToNonceTimestamps < ActiveRecord::Migration
  def change
      add_column :nonce_timestamps, :nonce, :string
      add_column :nonce_timestamps, :oauth_timestamp, :string
  end
end
