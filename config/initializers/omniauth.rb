OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '542972591262-job8i385m8e9599e0deo4hsslko39e47.apps.googleusercontent.com', 'PCLfIx30TdKunlMyBCru1W3p', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end