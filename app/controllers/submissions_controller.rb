class SubmissionsController < ApplicationController

    def show
        @prompt = Prompt.find(params[:prompt_id])
        @submission = Submission.find(params[:id])
        @review_types = @prompt.review_types.map(&:review_type)
    end

    def new
        @prompt = Prompt.find(params[:prompt_id])
        @submission = @prompt.submissions.build
    end

    def create
        @prompt = Prompt.find(params[:prompt_id])
        @submission = @prompt.submissions.new(params[:submission])
        @submission.user_id = current_user.id

        if @submission.save
            redirect_to prompt_submission_path(@prompt, @submission)
        else
            render :create
        end
    end

    def edit
        @prompt = Prompt.find(params[:prompt_id])
        @submission = Submission.find(params[:id])
    end

    def update
        @prompt = Prompt.find(params[:prompt_id])
        @submission = Submission.find(params[:id])
        @submission.update_attributes(params[:submission])

        if @submission.save
            redirect_to prompt_submission_path(@prompt, @submission)
        end
    end

    def destroy
        @submission = Submission.find(params[:id])
        @prompt = @submission.prompt

        @submission.destroy

        redirect_to context_prompt_path(@prompt.context, @prompt)
    end

end
