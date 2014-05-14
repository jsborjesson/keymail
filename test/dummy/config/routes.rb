Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  root 'auth#new'
  post 'request_email', to: 'auth#request_email'
  get  'auth/:url_key', to: 'auth#validate_link', as: 'keymail_link_target'

  get  'success',       to: 'auth#success'
  get  'fail',          to: 'auth#fail'

end
