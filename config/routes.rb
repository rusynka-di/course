Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  #root "room#index"
 
  resources :questions
  resource :session, only: %i[new create destroy test]
  resources :users
  resource :profile, only: [:edit, :update, :show]
  resources :rooms
end

# post '/questions', to: 'questions#create'
#   patch '/questions/:id', to: 'questions#update'
#   delete '/questions/:id', to: 'questions#destroy'
