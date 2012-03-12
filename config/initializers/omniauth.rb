Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['SHUFFLE_PIC_CONSUMER_KEY'], ENV['SHUFFLE_PIC_CONSUMER_KEY']
end
