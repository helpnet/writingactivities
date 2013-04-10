class LtiToolController < ApplicationController

    $oauth_creds = {"test" => "secret", "testing" => "supersecret"}

    def lti_tool

        authorize!

        if @valid_lti
            if @tp.custom_params['path']
                redirect_to "/#{@tp.custom_params['path']}"
            else
                redirect_to :root
            end
        end

    end

    def authorize!

        @valid_lti = false

        if key = params['oauth_consumer_key']
            if secret = $oauth_creds[key]
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
        end

        @lti_stuff = @tp.inspect

        session['launch_params'] = @tp.to_params
        session['lti_username'] = @tp.username
    end

end
