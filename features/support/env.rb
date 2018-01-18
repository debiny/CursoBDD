require 'rspec'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'site_prism'

require_relative 'helpers'

World(Helpers)

$browser = ENV['BROWSER']

Capybara.register_driver :selenium do |app|
    
        if $browser.eql?('chrome')
            #subir o chrome
    
            Capybara::Selenium::Driver.new(
                app,
                browser: :chrome,
                desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                    'chromeOption' => {
                        'args' => ['window-size=1280,800']
                    }
                )
            )
    
    
        elsif $browser.eql?('firefox')
            #subir o firefox
    
            Capybara::Selenium::Driver.new(
                app,
                browser: :firefox,
                marionette: true
            )
    
        elsif $browser.eql?('phantomjs')
            # Testar em headless

            Capybara::Poltergeist::Driver.new(
                app,
                options = {
                    :js_errors => false
                }
            )
    

        end
    end
    


Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host ='https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5