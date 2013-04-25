Given(/^the following contexts exist:$/) do |table|
    table.hashes.each do |context|
        Context.create( context_label: context[:context_label], context_title: context[:context_label] )
    end
end

Given(/^the following users exist:$/) do |table|
    table.hashes.each do |user|
        User.create( email: user[:email], password: user[:password] )
    end
end

Given(/^the following memberships exist:$/) do |table|
    table.hashes.each do |membership|
        user = User.find_by_email(membership[:user])
        context = Context.find_by_context_label(membership[:context])
        role = membership[:role]

        Membership.create( user_id: user.id, context_id: context.id, role: role )
    end
end

# TODO: Make this context association more specific

Given(/^the following prompts exist:$/) do |table|
    table.hashes.each do |prompt|
        context = Context.last
        Context.last.prompts.create( title: prompt[:title], body: prompt[:body])
    end
end

Given(/^the following submissions exist:$/) do |table|
    table.hashes.each do |submission|
        user = User.find_by_email(submission[:user])
        prompt = Prompt.find_by_title(submission[:prompt])

        submission = prompt.submissions.new( body: submission[:body] )
        submission.user_id = user.id
        assert submission.save
    end
end

Given(/^I am on the "(.*?)" page$/) do |arg1|
    visit "/#{arg1}"
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, input|
    fill_in field, :with => input
end

Then(/^I should see "(.*?)"$/) do |arg1|
    page.should have_content(arg1)
end


Then(/^I should not see "(.*?)"$/) do |arg1|
    page.should have_no_content(arg1)
end

Given(/^I press "(.*?)"$/) do |arg1|
    click_button arg1
end

Then(/^show page$/) do
    puts page.body
end

Given(/^I send "(.*?)" as "(.*?)" to "(.*?)"$/) do |param, input, path|
    input.gsub!("\\r\\n","\r\n")
    Capybara.current_session.driver.submit :post, "/#{path}", param => input
end

Then(/^I should see list item "(.*?)"$/) do |content|
    page.body.include?("<li>" + content + "</li>").should be_true
end

Then(/^I should see html "(.*?)"$/) do |arg1|
    page.body.include?(arg1).should be_true
end

Given(/^I am on the context page for "(.*?)"$/) do |context_label|
    context = Context.find_by_context_label(context_label)
    visit context_url(context)
    assert page.should have_content("#{context.context_label} #{context.context_title}")
end

Given(/^I click "(.*?)"$/) do |link|
    click_link link
end

Given(/^I select the "(.*?)" checkbox$/) do |checkbox|
    check checkbox
end

Given(/^"(.*?)" is logged in$/) do |email|
    visit '/users/sign_in'
    fill_in "user_email", :with => email
    fill_in "user_password", :with => 'testpass'
    click_button "Sign in"
end

Then(/^I should see "(.*?)" listed under Drafts$/) do |email|
    page.should have_selector ".content" do |matches|
        matches.should have_content email
    end
end
