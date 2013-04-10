class LtiToolController < ApplicationController

    $oauth_creds = {"test" => "secret", "testing" => "supersecret"}

    def lti_tool
        @lti_stuff = params
        session['lti'] = params

        if params['custom_path']
            redirect_to "/#{params['custom_path']}"
        end

    end

end
