class ApplicationMailer < ActionMailer::Base
  default to: 'a.crossan@surrey.ac.uk', from: 'info@equalizer.com'
  layout 'mailer'
end
