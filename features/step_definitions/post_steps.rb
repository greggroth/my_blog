Given /^I have posts titled (.+)$/ do |titles|
  titles.split(',').each do |title|
    Post.create!( title: title, body: "Test body" )
  end
end

Then /^I should see "([^"]*)"$/ do |something_worth_seeing|
  page.should have_content something_worth_seeing
end

Then /^I should not see "([^"]*)"$/ do |something_misplaced|
  page.should_not have_content something_misplaced
end

Given /^a post "([^"]*)" with content "([^"]*)"$/ do |title, body|
  Post.create!(title: title, body: body)
end

Given /^I am on the (.+) page$/ do |page|
  visit page
end

When /^I click "([^"]*)"$/ do |link_name|
  click_link link_name
end

Given /^a post "([^"]*)" with content "([^"]*)" is tagged as "([^"]*)"$/ do |title, body, tag|
  new_tag = Tag.create!(name: tag)
  new_post = Post.create!(title: title, body: body)
  new_post.tags << new_tag
end

Given /^an admin "([^"]*)" has an account$/ do |email|
  @admin = Admin.create(email: email, password: 'awesome')
end

When /^I log in$/ do
  visit(new_admin_session_path)
  fill_in('Email', with: @admin.email)
  fill_in('Password', with: @admin.password)
  click_button "Sign in"
end

Given /^he is logged in$/ do
  visit(new_admin_session_path)
  fill_in('Email', with: @admin.email)
  fill_in('Password', with: @admin.password)
  click_button "Sign in"
end

Then /^I should see a link to "([^"]*)"$/ do |link_name|
  page.should have_link link_name
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |box_name, content|
  fill_in box_name, with: content
end

When /^I click button "([^"]*)"$/ do |button_name|
  click_button button_name
end