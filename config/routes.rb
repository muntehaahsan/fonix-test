Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "user#index"
  post '/user_code', to: 'user#user_code' , as: 'user_code'
  post '/verify_user', to: 'user#verify_user' , as: 'verify_user'
end
