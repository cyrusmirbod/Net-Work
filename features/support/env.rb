require 'capybara/cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'test-unit'
require 'yaml'
require 'tiny_tds'
require 'rubygems'
require 'require_all'
require 'site_prism'
require 'rack/test'
require 'nokogiri'
require 'open-uri'


#def wait_until(timeout = Capybara.default_wait_time)
 # Capybara.timeout(timeout, driver) { chrome }
#end

def take_screenshot()
  time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
  name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/", "_")
  puts "Name of snapshot is #{name_of_scenario}"
  file_path = './Screenshots/' + name_of_scenario + '.png'
  #page.driver.browser.save_screenshot file_path
end