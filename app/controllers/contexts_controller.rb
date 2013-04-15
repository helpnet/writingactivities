class ContextsController < ApplicationController
    def show
        @context = Context.find(params[:id])
    end
end
