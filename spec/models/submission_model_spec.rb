require 'spec_helper'

describe Submission do

    describe "should calculate the number of submissions" do

        it "by returning 0 for submission with no reviews" do
            FactoryGirl.create(:context)
            FactoryGirl.create(:prompt)
            user = FactoryGirl.create(:prompt)
            submission = FactoryGirl.create(:submission, :user_id => user.id)

            submission.number_of_reviews.should be(0)
        end

        it "by returning 2 for submission with two reviews" do
            FactoryGirl.create(:context)
            FactoryGirl.create(:prompt)
            FactoryGirl.create(:review_type)
            FactoryGirl.create(:review_type, :review_type => 'research_introduction_reviews')
            user = FactoryGirl.create(:prompt)
            submission = FactoryGirl.create(:submission, :user_id => user.id)
            reviewer = FactoryGirl.create(:user, :email => 'gob@example.com')
            basic = FactoryGirl.create(:basic_review, :user_id => reviewer.id, :submission_id => submission.id)
            research = FactoryGirl.create(:research_introduction_review, :user_id => reviewer.id, :submission_id => submission.id)

            total = Submission.find(submission.id)
            total.number_of_reviews.should be(2)

        end

    end
end
