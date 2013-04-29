class ResearchIntroductionReviewsController < ApplicationController
    def new
        @submission = Submission.find(params[:id])
    end

    def create
        @submission = Submission.find(params[:submission_id])
        @research_introduction_review = @submission.research_introduction_reviews.new(params[:basic_review])
        @research_introduction_review.user_id = current_user.id

        if @research_introduction_review.save
            redirect_to prompt_submission_path(@submission.prompt, @submission)
        else
            redirect_to create
        end 
    end

    def feedback
        @submission = Submission.find(params[:submission_id])
    end 
end
