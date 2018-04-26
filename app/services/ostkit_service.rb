require('ost-sdk-ruby')

# Wrapper around of the SDK.
class OSTKitService
  def initialize
    api_key = Rails.application.secrets.ostkit_key
    api_secret = Rails.application.secrets.ostkit_secret
    @environment = Rails.application.secrets.ostkit_env
    @credentials = OSTSdk::Util::APICredentials.new(api_key, api_secret)
  end

  def users
    OSTSdk::Saas::Users.new(@environment, @credentials)
  end

  def transactions
    OSTSdk::Saas::TransactionKind.new(@environment, @credentials)
  end
end
