# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'jungle',
  :password => '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',
  :domain => 'rogerchao.com',
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :authentication => :plain,
  :enable_starttls_auto => true
}