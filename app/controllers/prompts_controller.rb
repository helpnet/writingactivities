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
            create_review_types
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
        create_review_types

        redirect_to context_prompt_path(@context, @prompt)
    end

    def create_review_types
        if params[:review_types]
            params[:review_types].each do |review_type|
                ReviewType.find_or_create_by_prompt_id_and_review_type(@prompt.id, review_type)
            end
        end
    end

end
