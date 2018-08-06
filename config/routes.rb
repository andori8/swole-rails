Rails.application.routes.draw do
  resources :exercises
  resources :workouts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#index'
end
