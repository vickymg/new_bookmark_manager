require 'mailgun'

class SendRecoverLink

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['your_api_key'])
  end

  def self.call(user, mailer = nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['mailgun_domain_name'],
     {from: 'bookmarkmanager@mail.com',
      to: user.email,
      subject: 'Reset your password',
      text: "Click here to reset your password: http://new-bookmark-manager.herokuapp.com/reset_password?token=#{user.password_token}" })
  end

  private
  attr_reader :mailer
end
