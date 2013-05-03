class LtiToolController < ApplicationController

    def lti_tool

        reset_session

        @lti_launch = Consumer.authorize!(params, request)
        @tp = @lti_launch

        if @tp.lti_msg = 'success'

            @consumer = Consumer.find_by_key(params['oauth_consumer_key'])

            @context = Consumer.set_up_context(@consumer, @tp)
            
            user = create_or_sign_in(@tp.lis_person_contact_email_primary) if @tp.lis_person_contact_email_primary

            if user && @tp.roles
                role = set_role(@tp.roles)
                Membership.create!( :user_id => user.id, :context_id => @context.id, :role => role ) unless user.contexts.include?(@context)
            end
            
            if @tp.custom_params['path']
                redirect_to "/#{@tp.custom_params['path']}"
            else
                if user
                    redirect_to @context, :notice => "Successful LTI launch from #{@tp.context_label}: #{@tp.context_title}"
                else
                    redirect_to :root, :notice => "No valid user data"
                end
            end
        else
            redirect_to :root, :alert => @lti_launch.message
        end

    end

    def lti_exam
        @context = Context.find(params[:context]);

        if session['launch_params']
            key = session['launch_params']['oauth_consumer_key']
        else
            flash[:alert] = "Tool never launched."
        end

        @tp = IMS::LTI::ToolProvider.new(key, Consumer.find_by_key(key).secret, session['launch_params'])

        if !@tp.outcome_service?
            redirect_to @context, :alert =>  "Tool not launched as an outcome service."
        else
            res = @tp.post_replace_result!(params['score'])

            if res.success?
                redirect_to @context, :notice => "You gave yourself #{params['score'].to_f * 100}"
            else
                flash[:alert] = "Score not sent. #{res.description}"
            end
        end

    end

    def create_or_sign_in(email)
        if user = User.find_by_email(email)
        else
            user = User.create!( :email => email, :password => Devise.friendly_token[0,20])
        end
        sign_in :user, user
    end

    def set_role(roles)
        if roles.include?("urn:lti:role:ims/lis/instructor") or roles.include?("instructor")
            "instructor"
        else
            "learner"
        end
    end
end
