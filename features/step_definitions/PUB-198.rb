And(/^I select the Issue (\d+) folder$/) do |arg|
  click_link('issue-303')
end

And(/^If there is a cover I open and delete it otherwise i continue$/) do
  if has_link?('cover.jpg')
    click_link('cover.jpg')
    sleep 6
    click_link('Delete Document')
    sleep 10
    click_button('Delete')
  else
    puts "No Cover Found"
  end
end


And(/^I navigate to the Compiler login page$/) do
  visit("http://cat-content.dave.net-a-porter.com:18080/share/page/pugpig-content-compiler")
end

Then(/^I should see the compiler build form$/) do
  assert_text("Net-A-Porter Issue Compiler", count: 1)
end

When(/^I kick off a build for Issue 303$/) do
  find(:id, 'issue').set "303"
  click_button('Build')
  sleep 5
end

And(/^The build completes$/) do
  wait_until
  page.should have_content("Item added!")
  #assert_text("You don't have any favorite filters.", count: 1).should be_visible
  #else
  # puts "Build Failed"
  #page.should have_text('#some_element', :visible => false)
  #end
end


Then(/^I navigate to the Alfreso Login page$/) do
  sleep 10
  visit("http://cat-content.dave:18080/share")
end

And(/^I open the xml and check that the cover record details a missing file$/) do
  link = find('div.document-view-content a')[:href] #finds in the xml the link assigned under div.document-view-content find the a in the href
  # puts link
  xmldocument = Nokogiri::XML(open(link, :http_basic_authentication => ['admin', 'admin'])) #using the Nokogiri library hit the url and log in
  coverdetails = xmldocument.css('feed > entry > link')[0]['href'] #under feed find the updated
  puts coverdetails
  coverdetailsformat = "./issue-303/missing.file".match (coverdetails)

  if coverdetailsformat == nil
    puts "The feed updated time is in the incorrect format"
  else
    puts "The feed Updated time is in the correct format"
  end
end


And(/^I select and open Issue (\d+) folder$/) do |arg|
  click_link('issue-300')
end


And(/^I copy the cover from this Issue to Issue$/) do
  click_link('cover.jpg')
  sleep 5
  click_link('Copy to...')
  sleep 5
  find('.ygtvlabel', :text=>"issue-303").click
  sleep 5
  click_button('Copy')
  sleep 2
  expect(page).to have_css('#message', :text=>"Files being copied...")
  sleep 30
  expect(page).to have_link('issues')
end

And(/^I select the Issues nav button$/) do
 click_link('issues')
end
 # end
#end


