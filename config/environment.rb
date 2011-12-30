# Load the rails application
require File.expand_path('../application', __FILE__)

#config.gem 'paperclip'

Paperclip.options[:command_path] = "C:/Program Files (x86)/ImageMagick-6.7.4-Q16/"

# Initialize the rails application
OrchiveApp::Application.initialize!
