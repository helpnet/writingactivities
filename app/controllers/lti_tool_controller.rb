class LtiToolController < ApplicationController

    def lti_tool

        authorize!

        if @valid_lti
            
            @context = Context.find_or_create_by_context_label_and_context_title(@tp.context_label, @tp.context_title)
            create_or_sign_in(@tp.lis_person_contact_email_primary)
            
            if @tp.custom_params['path']
                redirect_to "/#{@tp.custom_params['path']}"
            else
                redirect_to :root, :notice => "Successful LTI launch from #{@tp.context_label}: #{@tp.context_title}"
            end
        else
            redirect_to :root, :alert => @message
        end

    end

    def lti_exam
        if session['launch_params']
            key = session['launch_params']['oauth_consumer_key']
        else
            flash[:alert] = "Tool never launched."
        end

        @tp = IMS::LTI::ToolProvider.new(key, Consumer.find_by_key(key).secret, session['launch_params'])

        if !@tp.outcome_service?
            redirect_to :root, :alert =>  "Tool not launched as an outcome service."
        else
            res = @tp.post_replace_result!(params['score'])

            if res.success?
                redirect_to :root, :notice => "You gave yourself #{params['score'].to_f * 100}"
            else
                flash[:alert] = "Score not sent. #{res.description}"
            end
        end

    end

    def create_or_sign_in(email)
        if user = User.find_by_email(email)
        else
            user = User.create!( :email => email, :password => Devise.friendly_token[0,20] )
        end
        sign_in :user, user
    end

    def authorize!

        @valid_lti = false

        if key = params['oauth_consumer_key']
            if Consumer.find_by_key(key) and secret = Consumer.find_by_key(key).secret
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

        @lti_stuff = @tp.inspect

        if @valid_lti
            session['launch_params'] = @tp.to_params
            session['lti_username'] = @tp.username
        end
    end

end
