require 'rspec'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host= 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5