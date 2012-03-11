Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'consumer_key', 'consumer_secret'
end
