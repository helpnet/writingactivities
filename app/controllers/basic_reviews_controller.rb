class BasicReviewsController < ApplicationController
    
    def new
        @submission = Submission.find(params[:id])
    end
    
    def create
        @submission = Submission.find(params[:submission_id])
        @basic_review = @submission.basic_reviews.new(params[:basic_review])
        @basic_review.user_id = current_user.id

        if @basic_review.save
            redirect_to prompt_submission_path(@submission.prompt, @submission)
        else
            flash[:errors] = @basic_review.errors.full_messages
            redirect_to prompt_submission_path(@submission.prompt, @submission)
        end
    end

    def feedback
        @submission = Submission.find(params[:submission_id])
    end

end
