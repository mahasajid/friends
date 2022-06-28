Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :developer unless Rails.env.production?
    provider :facebook, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
    #"551695616443770",  "ab871d733b0aa35faafb1e6c7d97c5cd"
end 