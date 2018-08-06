Rails.application.routes.draw do
  resources :workouts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#index'
end
