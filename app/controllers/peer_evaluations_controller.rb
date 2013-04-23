class PeerEvaluationsController < ApplicationController
    
    def new
        @submission = Submission.find(params[:id])
    end
    
    def create
        @submission = Submission.find(params[:submission_id])
        @peer_evaluation = @submission.peer_evaluations.new(params[:peer_evaluation])
        @peer_evaluation.user_id = current_user.id

        if @peer_evaluation.save
            redirect_to prompt_submission_path(@submission.prompt, @submission)
        else
            redirect_to create
        end
    end

    def feedback
        @submission = Submission.find(params[:submission_id])
    end

end
