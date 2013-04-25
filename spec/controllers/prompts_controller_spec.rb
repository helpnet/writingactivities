require 'spec_helper'
FactoryGirl.find_definitions

describe PromptsController do

    it "should associate review types on successful create" do
        context = FactoryGirl.create(:context)
        post 'create', :prompt => { title: 'test', body: 'test' },  :review_types => ["basic_reviews"], :context_id => context.id

        context.prompts.first.review_types.map(&:review_type).should include("basic_reviews")
    end
end
