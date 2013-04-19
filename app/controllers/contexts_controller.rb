class ContextsController < ApplicationController
    def show
        @context = Context.find(params[:id])
        if current_user
            @role = current_user.memberships.where("context_id = #{@context.id}").first.role
        else
            @role = 'no role'
        end
    end
end
