class PromptsController < ApplicationController
    def show
        @context = Context.find(params[:context_id])
        @prompt = Prompt.find(params[:id])
        @review_types = []
        
        @prompt.review_types.map(&:review_type).each do |type|
            @review_types << ReviewType.review_types[type.to_sym]
        end

        @review_types = @review_types.join(', ')

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
            redirect_to @context
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
        destroy_review_types

        redirect_to context_prompt_path(@context, @prompt)
    end

    def destroy
        @prompt = Prompt.find(params[:id])
        @context = @prompt.context
        @prompt.destroy

        redirect_to @contextA
    end

    def create_review_types
        if params[:review_types]
            params[:review_types].each do |review_type|
                ReviewType.find_or_create_by_prompt_id_and_review_type(@prompt.id, review_type)
            end
        end
    end

    def destroy_review_types
        if !params[:review_types]
            @prompt.review_types.destroy_all
        elsif params[:review_types]
            if @prompt.review_types.length > params[:review_types].length
                types_to_destroy = @prompt.review_types.map(&:review_type) - params[:review_types]

                types_to_destroy.each do |type|
                    @prompt.review_types.where('review_type = ?', type).destroy_all
                end
            end
        end

    end

end
