class ApplicationMailer < ActionMailer::Base
  default from: 'mail-agent@horvo.me'
  layout 'mailer'
end
