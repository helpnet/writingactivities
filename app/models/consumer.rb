class Consumer < ActiveRecord::Base
  attr_accessible :key, :name, :secret

  has_many :contexts

  def self.authorize!(params, request)

        if key = params['oauth_consumer_key']
            if @consumer = Consumer.find_by_key(key) and secret = @consumer.secret
                @tp = IMS::LTI::ToolProvider.new(key, secret, params)
            else
                @tp = IMS::LTI::ToolProvider.new(nil, nil, params)
                @tp.lti_msg = "Your consumer didn't use a recognized key."
                @tp.lti_errorlog = "You did it wrong!"
                return @tp
            end 

        else
            @tp.lti_msg = "No consumer key"
            return @tp
        end 

        if !@tp.valid_request?(request)
            @tp.lti_msg = "The OAuth signature was invalid."
            return @tp
        end 

        if Time.now.utc.to_i - @tp.request_oauth_timestamp.to_i > 60*60
            @tp.lti_msg = "Request is too old"
            return @tp
        end 

        if !nonce_is_valid?(@tp.request_oauth_nonce, @tp.request_oauth_timestamp)
            @tp.lti_msg = "Nonce was already used, please try again."
            return @tp
        end 

        @tp.lti_msg = 'success'
        @tp

    end 

    def self.nonce_is_valid?(nonce, timestamp)
        if existing_nonce = NonceTimestamp.find_by_nonce(nonce)
            existing_nonce.oauth_timestamp == timestamp ? validity = false : validity = true
        else
            NonceTimestamp.create(:nonce => nonce, :oauth_timestamp => timestamp)
            validity = true
        end
        return validity
    end

    def self.set_up_context(consumer, tp)
        consumer.contexts.find_or_create_by_context_label_and_context_title(tp.context_label, tp.context_title) if tp.context_label and tp.context_title
    end

    def self.set_role(roles)
        if roles.include?("urn:lti:role:ims/lis/instructor") or roles.include?("instructor")
            "instructor"
        else
            "learner"
        end 
    end

    def self.set_membership(tp, user, context)
        role = set_role(tp.roles)
        Membership.create!( :user_id => user.id, :context_id => context.id, :role => role ) unless user.contexts.include?(context)
    end
end
