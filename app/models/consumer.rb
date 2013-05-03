class Consumer < ActiveRecord::Base
  attr_accessible :key, :name, :secret

  has_many :contexts

  def self.authorize!(params, request)

        @valid_lti = false

        if key = params['oauth_consumer_key']
            if @consumer = Consumer.find_by_key(key) and secret = @consumer.secret
                @tp = IMS::LTI::ToolProvider.new(key, secret, params)
                @message = "Successful LTI launch."
                @valid_lti = true
            else
                @tp = IMS::LTI::ToolProvider.new(nil, nil, params)
                @tp.lti_msg = "Your consumer didn't use a recognized key."
                @tp.lti_errorlog = "You did it wrong!"
                @message = "Consumer key wasn't recognized."
            end 
        else
            @message = "No consumer key"
        end 

        if !@tp.valid_request?(request)
            @message = "The OAuth signature was invalid."
            @valid_lti = false
        end 

        if Time.now.utc.to_i - @tp.request_oauth_timestamp.to_i > 60*60
            @valid_lti = false
            @message = "Request is too old"
        end 

        if !nonce_is_valid?(@tp.request_oauth_nonce, @tp.request_oauth_timestamp)
            @valid_lti = false
            @message = "Nonce was already used, please try again."
        end 

        if @valid_lti
            session['launch_params'] = @tp.to_params
            session['lti_username'] = @tp.username
            session['current_context'] = @tp.context_label
            @tp.lti_msg = 'success'
        end 

        @tp

    end 

    def self.nonce_is_valid?(nonce, timestamp)
        if existing_nonce = NonceTimestamp.find_by_nonce(nonce)
            if existing_nonce.oauth_timestamp == timestamp
                return false
            end

        end

    end

end
