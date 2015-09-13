OmniAuth.config.logger = Rails.logger
if Rails.env.development? 
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end