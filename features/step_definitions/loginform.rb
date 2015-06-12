Given(/^I am on  the Alfreso Login page$/) do
  visit("http://cat-content.dave:18080/share")
end

When(/^I enter my username in the username field$/) do
  $loginform_object.user_name.set "c.mirbod"
end

And(/^I enter my password in the password field$/) do
  $loginform_object.password.set "Keyahn2009"
end

And(/^I click on login button$/) do
  $loginform_object.login_button.click
end

Then(/^I should see the directory page$/) do
  assert_text('Welcome to your dashboard, Cyrus Mirbod', count: 1)
end