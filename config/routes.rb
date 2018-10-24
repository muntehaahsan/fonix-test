Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "user#index"
  post '/user_code', to: 'user#user_code' , as: 'user_code'
  get '/user_code', to: 'user#show_warning' , as: 'show_warning'
  post '/verify_user', to: 'user#verify_user' , as: 'verify_user'
end
