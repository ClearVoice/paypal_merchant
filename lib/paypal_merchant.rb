require 'paypal-sdk-merchant'
require 'money'
require 'paypal/merchant'
require 'paypal/merchant/do_direct_payment'
require 'paypal/merchant/mass_pay'
require 'paypal/merchant/reporting'
require 'paypal/account'
require 'paypal/charge'
require 'paypal/transfer'

module PayPal

  @mode = "sandbox"

  @logger = PayPal::SDK::Core::Logging.logger

  class << self

    attr_accessor :mode, :logger, :client_id, :client_secret, :username, :password, :signature

    def configure
      yield self
      configure_sdk
      self
    end

  end

private

  def PayPal.configure_sdk
    PayPal::SDK::Core::Config.logger = @logger
    PayPal::SDK.configure(
      mode: @mode,
      client_id: @client_id,
      client_secret: @client_secret,
      username: @username,
      password: @password,
      signature: @signature
    )
  end

end