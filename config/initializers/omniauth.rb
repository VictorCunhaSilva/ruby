OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '410535448386-jb6bqb5kbner13nsks7sp63b3jg1kbi7.apps.googleusercontent.com', 
                            'XaX5TmgHlEHRTNd38mCbms_Y',
  {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end