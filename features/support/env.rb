# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/cucumber'
require 'selenium-webdriver'

# https://docs.travis-ci.com/user/chrome#capybara
Capybara.register_driver :chrome do |app|
  args = %w[no-sandbox headless disable-gpu]
  options = Selenium::WebDriver::Chrome::Options.new(args: args)

  Capybara::Selenium::Driver
    .new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome
