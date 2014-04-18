Keymail::Engine.routes.draw do
  get 'auth/:url_key' => 'authentication#not_yet_implemented', as: 'authentication_link'
end
