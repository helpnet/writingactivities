class HomeController < ApplicationController
    
    def home
        if session['launch_params']
            key = session['launch_params']['oauth_consumer_key']
            @tp = IMS::LTI::ToolProvider.new(key, $oauth_creds[key], session['launch_params'])
        end
    end

    def sample_text
    end

end
