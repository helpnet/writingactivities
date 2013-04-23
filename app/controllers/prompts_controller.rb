class PromptsController < ApplicationController
    def show
        @context = Context.find(params[:context_id])
        @prompt = Prompt.find(params[:id])
    end

    def new
        @context = Context.find(params[:context_id])
        @prompt = @context.prompts.build
    end

    def create
        @context = Context.find(params[:context_id])
        @prompt = @context.prompts.new(params[:prompt])

        if @prompt.save
            redirect_to context_prompt_path(@context, @prompt)
        else
            render :create
        end

    end

    def edit
        @context = Context.find(params[:context_id])
        @prompt = Prompt.find(params[:id])
    end

    def update
        @context = Context.find(params[:context_id])
        @prompt = Prompt.find(params[:id])
        @prompt.update_attributes(params[:prompt])

        redirect_to context_prompt_path(@context, @prompt)
    end

end
