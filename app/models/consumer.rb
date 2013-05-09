class Consumer < ActiveRecord::Base
  attr_accessible :key, :name, :secret

  has_many :contexts

  def self.authorize!(params, request)

        @valid_lti = false

        if key = params['oauth_consumer_key']
            if @consumer = Consumer.find_by_key(key) and secret = @consumer.secret
                @tp = IMS::LTI::ToolProvider.new(key, secret, params)
                @valid_lti = true
            else
                @tp = IMS::LTI::ToolProvider.new(nil, nil, params)
                @tp.lti_msg = "Your consumer didn't use a recognized key."
                @tp.lti_errorlog = "You did it wrong!"
                @valid_lti = false
                return @tp
            end 

        else
            @tp.lti_msg = "No consumer key"
            return @tp
        end 

        if !@tp.valid_request?(request)
            @tp.lti_msg = "The OAuth signature was invalid."
            @valid_lti = false
            return @tp
        end 

        if Time.now.utc.to_i - @tp.request_oauth_timestamp.to_i > 60*60
            @valid_lti = false
            @tp.lti_msg = "Request is too old"
            return @tp
        end 

        if !nonce_is_valid?(@tp.request_oauth_nonce, @tp.request_oauth_timestamp)
            @valid_lti = false
            @tp.lti_msg = "Nonce was already used, please try again."
            return @tp
        end 

        if @valid_lti
            @tp.lti_msg = 'success'
        end 

        @tp

    end 

    def self.nonce_is_valid?(nonce, timestamp)
        if existing_nonce = NonceTimestamp.find_by_nonce(nonce)
            if existing_nonce.oauth_timestamp == timestamp
                return false
            else
                return true
            end
        else
            return true
        end
    end

    def self.set_up_context(consumer, tp)
        consumer.contexts.find_or_create_by_context_label_and_context_title(tp.context_label, tp.context_title) if tp.context_label and tp.context_title
    end

end
