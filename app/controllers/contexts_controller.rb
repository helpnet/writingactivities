class ContextsController < ApplicationController
    def show
        @context = Context.find(params[:id])
        @role = current_user.memberships.where("context_id == #{@context.id}").first.role
    end
end
