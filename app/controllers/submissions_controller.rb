class SubmissionsController < ApplicationController

    def show
        @prompt = Prompt.find(params[:prompt_id])
        @submission = Submission.find(params[:id])
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

end
