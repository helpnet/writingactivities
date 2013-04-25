FactoryGirl.define do
    factory :prompt do
        title "test activity"
        body "submit something cool"
        context_id 1
    end

    factory :context do
        context_label "TC101"
        context_title "Test Course 101"
        consumer_id "test"
    end

end
