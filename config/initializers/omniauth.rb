OmniAuth.config.logger = Rails.logger
if Rails.env.development? 
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '552169418265191', '20828a1a0faf789dca76b384bf09b30e',:client_options => {:ssl => {:ca_file => Rails.root.join('mycert.crt').to_s}}
end