class NonceTimestamp < ActiveRecord::Base
    attr_accessible :oauth_timestamp, :nonce
end
