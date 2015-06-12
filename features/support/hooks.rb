Before do

Capybara.default_driver = :chrome

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :switches => ['--allow-running-insecure-content', '-no-sandbox'])
 
end 

#$client = TinyTds::Client.new(:username => "employee", :password => "employee", :dataserver => "WTIOD248\\dynamicopssql001", :database => "WPT_EMPLOYEE_TST_01")
page.driver.browser.manage.window.maximize
#@config = YAML.load_file("features/support/config.yml")
@environments = YAML.load_file("config/environments/default.yml")
require_all './Page Objects/*.rb'
$loginform_object = Loginform.new
end
 
#Run after each scenario
After do |scenario|
  #Check, scenario is failed?
  if(scenario.failed?)
         time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
         name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
         puts "Name of snapshot is #{name_of_scenario}"
         file_path = './Screenshots/' + name_of_scenario + '.png'
         page.driver.browser.save_screenshot file_path
         puts "Snapshot is taken"
    puts "#===========================================================#"
    puts "Scenario:: #{scenario.name}"
    puts "#===========================================================#"
  end
end

