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
