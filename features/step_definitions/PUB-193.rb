$popup

When(/^I select the Search for Sites link from the Sites dropdown$/) do
  sleep 3
  find(:id, 'global_x002e_header_x0023_default-app_sites-button').click
  click_link('Search for Sites')
  sleep 3
end


Then(/^I should see the Site Finder page$/) do
  assert_text("Site Finder", count: 1)
end

When(/^I enter 'alfrescoAssets' into the search field and select the Search button$/) do
  find(:id, 'template_x002e_site-finder_x002e_site-finder_x0023_default-term').set 'alfrescoAssets'
  find(:id, 'template_x002e_site-finder_x002e_site-finder_x0023_default-button-button').click
  find(:id, 'template_x002e_site-finder_x002e_site-finder_x0023_default-term').set ''
  sleep 2
end

And(/^I select the alfrescoAssets link$/) do
  first(:link, "alfrescoAssets").click
end


Then(/^I should see the alfrescoAssets page$/) do
  assert_text("Welcome to alfrescoAssets, Cyrus Mirbod", count: 1)
end


When(/^I select the Document Library button$/) do
  click_link('Document Library')
  sleep 2
end

And(/^I select the Nap folder$/) do
  click_link('nap')
end

And(/^I select the Magazine folder$/) do
  click_link('magazine')
end

And(/^I select the Issues folder$/) do
  click_link('issues')
  sleep 2
end

And(/^I select the en\-intl\-all\.xml file$/) do
  click_link('en-intl-all.xml')
end

And(/^I open the xml and check that the Feed Updated, Entry Updated and Entry Published are all displaying as they should in the correct format$/) do

  link = find('div.document-view-content a')[:href] #finds in the xml the link assigned under div.document-view-content find the a in the href
  puts link
  xmldocument = Nokogiri::XML(open(link, :http_basic_authentication => ['admin', 'admin'])) #using the Nokogiri library hit the url and log in
  feedupdatedtime = xmldocument.css('feed > updated').text #under feed find the updated
  entryupdatedtime = xmldocument.css('entry > updated').first.text #under feed find the updated
  entrypublishedtime = xmldocument.css('entry > published').first #under feed find the updated

  feedupdateformat = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[+-]\d{2}:\d{2}/.match (feedupdatedtime)
  entryupdatedformat = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[+-]\d{2}:\d{2}/.match (entryupdatedtime)
  entrypublishedformat = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[+-]\d{2}:\d{2}/.match (entrypublishedtime)


  if feedupdateformat == nil
    puts "The feed updated time is in the incorrect format"
  else
    puts "The feed Updated time is in the correct format"
  end
  if entryupdatedformat == nil
    puts "The entry updated time is in the incorrect format"
  else
    puts "The entry Updated time is in the correct format"
  end
  if entrypublishedformat == nil
    puts "The entry Published time is in the incorrect format"
  else
    puts "The entry Published time is in the correct format"
  end


end

