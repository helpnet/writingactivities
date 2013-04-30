FactoryGirl.define do

    factory :context do
        context_label "TC101"
        context_title "Test Course 101"
        consumer_id "test"
    end

    factory :prompt do
        title "test activity"
        body "submit something cool"
        context_id 1
    end

    factory :user do
        email 'bob@example.com'
        password 'testpass'
    end

    factory :submission do
        body "my great submission"
        prompt_id 1
        user_id 1
    end

    factory :basic_review do
        user_id 1
        submission_id 1
        works "it's all good"
        does_not_work "a few bad things in there"
        main_idea "contractors on the death star were wrongfully harmed"
    end

    factory :research_introduction_review do
        user_id 1
        submission_id 1
        so_what "There is a problem and someone needs to fix it"
        hook "It's a really big problem"
        clarity "Pretty clear, mate"
    end

    factory :review_type do
        review_type 'basic_reviews'
        prompt_id 1
    end

    factory :membership do
        user_id 1
        context_id 1
        role 'learner'
    end

end
