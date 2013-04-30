require 'spec_helper'

describe User do

    describe "should return a role" do

        it "for a learner user" do
            context = FactoryGirl.create(:context)
            user = FactoryGirl.create(:user)
            FactoryGirl.create(:membership)

            expect(user.role_in(context)).to eq('learner')

        end

        it "for an instructor user" do
            context = FactoryGirl.create(:context)
            user = FactoryGirl.create(:user)
            FactoryGirl.create(:membership, :role => 'instructor')

            expect(user.role_in(context)).to eq('instructor')
        end

    end
end
