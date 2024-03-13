Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/keys/:key', to: 'key_values#show'
  post '/keys', to: 'key_values#create'
  patch '/keys/:key/:value', to: 'key_values#update'
  delete '/keys/:key', to: 'key_values#destroy'
end
